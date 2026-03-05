dnl SPDX-License-Identifier: GPL-3.0-or-later
dnl
divert(-1)

define(net_time, NetworkTime)
define(peer_tps, ClientServerTickRate)
define(hw_input, ClientInput)
define(hw_input_view, ClientInputData)
define(hotbar_slot, EquipmentSlotCD)
define(fishing_state, FishingStateCD)
define(local_ghost, GhostOwnerIsLocal)

define(ct_rw_of, ComponentType.ReadWrite<$1>())
define(ct_ro_of, ComponentType.ReadOnly<$1>())

define(entctl_set_cd, EntityManager.SetComponentData($@))
define(entctl_mk_single, EntityManager.CreateSingleton<$1>())

define(ec_rw_of, SystemAPI.GetComponentRW<$1>($2))
define(ec_ro_of, SystemAPI.GetComponent<$1>($2))
define(ec_single, SystemAPI.GetSingleton<$1>())
define(ec_single_rw, SystemAPI.GetSingletonRW<$1>())

define(ui_has_inv, Manager.ui.isAnyInventoryShowing)
define(ui_has_menu, Manager.menu.IsAnyMenuActive())

define(uu_cast, [[UnsafeUtility.As<$1, $2>($3)]])

define(FISHING_ROD_SLOT, EquipmentSlotType.FishingRodSlot)

define(BTN_STATE, CommandInputButtonStateNames)
define(RMB_HELD, SecondInteract_HeldDown)

divert(0)dnl
