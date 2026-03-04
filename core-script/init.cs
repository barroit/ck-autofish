// SPDX-License-Identifier: GPL-3.0-or-later
/*
 * Copyright 2024, 2025, 2026 Jiamu Sun <barroit@linux.com>
 */

using PugMod;
using UnityEngine;

public class init : IMod {

LoadedMod mod;
AssetBundle assets;

public void EarlyInit()
{
	state.fs = API.ConfigFilesystem;
}

public void Init()
{
}

public void Update()
{
}

public bool CanBeUnloaded()
{
	return true;
}

public void ModObjectLoaded(Object _) {}

public void Shutdown() {}

} /* class mikufish */
