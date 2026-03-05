// SPDX-License-Identifier: GPL-3.0-or-later
/*
 * Copyright 2024-2026 Jiamu Sun <barroit@linux.com>
 */

using PugMod;
using UnityEngine;

ISOLATE_BEGIN

public class init : IMod {

GameObject btn;

int prev_size = -39;

public void Init()
{
	var mikufish = mod_ctl.GetMod("NAME");
	var assets = mikufish.AssetBundles[0];

	var prefab = assets.LoadAsset<GameObject>("SWITCH_PREFAB");
	var parent = ui_player_inv.transform.GetChild(0);

	btn = Object.Instantiate(prefab, parent, false);
	btn.SetActive(true);
}

public void Update()
{
	if (!ui_has_player_inv)
		return;

	var inv = ui_player_inv.GetInventoryHandler();
	int next_size = inv.size;

	if (prev_size == next_size)
		return;

	var z = btn.transform.localPosition.z;
	var pos = new Vector3(7.6125f, 0.3125f, z);

	btn.transform.localPosition = pos;
	prev_size = next_size;
}

public void EarlyInit() {}

public void ModObjectLoaded(Object _) {}

public void Shutdown() {}

} /* class mikufish */

ISOLATE_END
