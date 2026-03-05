// SPDX-License-Identifier: GPL-3.0-or-later
/*
 * Copyright 2024-2026 Jiamu Sun <barroit@linux.com>
 */

using System;
using Unity.Collections;
using Unity.Collections.LowLevel.Unsafe;
using Unity.Entities;
using Unity.NetCode;
using UnityEngine;

using PlayerEquipment;
using PlayerState;

ISOLATE_BEGIN

public struct spoof_cd : IComponentData {
	public TickTimer tmr;
	public float delay;
	public bool enabled;
}

[WorldSystemFilter(WorldSystemFilterFlags.ClientSimulation)]
[UpdateInGroup(typeof(RunSimulationSystemGroup), OrderLast = true)]
[UpdateAfter(typeof(SendClientInputSystem))]
public partial class spoof_sys : SystemBase {

public static Entity ent;
public static EntityManager entctl;

EntityQuery player_query;

protected override void OnCreate()
{
	var spoof_in = state.load();

	if (spoof_in.delay == 0f) {
		spoof_in.__enabled = true;
		spoof_in.delay = 0.2f;
		state.save(spoof_in);
	}

	entctl = EntityManager;
	ent = entctl_mk_single(spoof_cd);

	var spoof = new spoof_cd {
		tmr = new TickTimer(39),
		delay = spoof_in.delay,
		enabled = spoof_in.__enabled,
	};

	entctl_set_cd(ent, spoof);

	var hw_input_rw = ct_rw_of(hw_input_view);
	var hotbar_slot_rw = ct_ro_of(hotbar_slot);
	var fishing_state_rw = ct_ro_of(fishing_state);
	var local_ghost_rw = ct_ro_of(local_ghost);

	player_query = GetEntityQuery(hw_input_rw, hotbar_slot_rw,
				      fishing_state_rw, local_ghost_rw);
	RequireForUpdate(player_query);
}

protected override void OnUpdate()
{
	var time = ec_single(net_time);
	var tick = time.ServerTick;

	var tps = ec_single(peer_tps);
	var sim_tps = (uint)tps.SimulationTickRate;

	var player = player_query.GetSingletonEntity();

	var __spoof = ec_single_rw(spoof_cd);
	ref var spoof = ref __spoof.ValueRW;

	var __input_view = ec_rw_of(hw_input_view, player);
	ref var input_view = ref __input_view.ValueRW;
	var input = uu_cast(hw_input_view, hw_input, ref input_view);

	var slot = ec_ro_of(hotbar_slot, player);
	var state = ec_ro_of(fishing_state, player);

	if (!spoof.enabled)
		return;

	if (slot.slotType != FISHING_ROD_SLOT)
		return;

	input.useFishingMiniGame = false;

	if (ui_has_inv || ui_has_menu) {
		if (spoof.tmr.isRunning)
			spoof.tmr.Stop(tick);

		return;
	}

	if (input.IsButtonStateSet(BTN_STATE.RMB_HELD))
		goto done;

	if (spoof.tmr.isRunning) {
		if (!spoof.tmr.IsTimerElapsed(tick)) {
			input.SetButtonState(BTN_STATE.RMB_HELD, true);
			goto done;
		}

		spoof.tmr.Stop(tick);
	}

	if (state.fishIsNibbling && !state.isFishingAtOctopusBoss)
		spoof.tmr.Start(tick, spoof.delay, sim_tps);

done:
	__input_view.ValueRW = uu_cast(hw_input, hw_input_view, ref input);
}

protected override void OnDestroy()
{
	var spoof = ec_single(spoof_cd);
	var spoof_in = state.load();

	spoof_in.__enabled = spoof.enabled;
	state.save(spoof_in);
}

} /* partial class spoof_system */

ISOLATE_END
