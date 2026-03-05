// SPDX-License-Identifier: GPL-3.0-or-later
/*
 * Copyright 2024, 2025 Jiamu Sun <barroit@linux.com>
 *
 * size		1.25	1.25
 * scale	1	1	1
 *
 * bg		trashcan_ui_9
 * bg_press	trashcan_ui_9
 * marker	crafting_ui_hand_15
 */

using I2.Loc;
using Unity.Entities;
using UnityEngine;

ISOLATE_BEGIN

public class switch_btn : ButtonUIElement {

public SpriteRenderer rod;

public LocalizedString mesg_disable_spoof;
public LocalizedString mesg_enable_spoof;

/*
 * disabled rgba(108, 91, 74, 1)
 * enabled  rgba(255, 255, 255, 1)
 */
Color disabled_color = new Color(0.4235f, 0.3568f, 0.2901f, 1f);
Color enabled_color = new Color(1f, 1f, 1f, 1f);

public void toggle_state()
{
	var spoof = __entctl_get_cd(spoof_sys.entctl, spoof_cd, spoof_sys.ent);

	spoof.enabled = !spoof.enabled;
	__entctl_set_cd(spoof_sys.entctl, spoof_sys.ent, spoof);
}

protected override void LateUpdate()
{
	var spoof = __entctl_get_cd(spoof_sys.entctl, spoof_cd, spoof_sys.ent);

	base.LateUpdate();

	if (spoof.enabled) {
		rod.color = enabled_color;
		optionalHoverDesc = mesg_disable_spoof;
	} else {
		rod.color = disabled_color;
		optionalHoverDesc = mesg_enable_spoof;
	}
}

} /* class switch_btn */

ISOLATE_END
