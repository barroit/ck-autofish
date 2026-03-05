// SPDX-License-Identifier: GPL-3.0-or-later
/*
 * Copyright 2024-2026 Jiamu Sun <barroit@linux.com>
 */
define(CONFIG, "NAME.json")dnl

using System;
using System.Text;
using UnityEngine;

using PugMod;

ISOLATE_BEGIN

[Serializable]
public struct spoof {
	public bool __enabled;
	public float delay;
}

public class state {

public static void save(in spoof spoof)
{
	string json = JsonUtility.ToJson(spoof, true);
	byte[] raw = Encoding.UTF8.GetBytes(json);

	mod_fs.Write(CONFIG, raw);
}

public static spoof load()
{
	if (!mod_fs.FileExists(CONFIG))
		return default;

	byte[] buf = mod_fs.Read(CONFIG);
	string json = Encoding.UTF8.GetString(buf);

	try {
		return JsonUtility.FromJson<spoof>(json);
	} catch (Exception) {
		return default;
	}
}

} /* class state */

ISOLATE_END
