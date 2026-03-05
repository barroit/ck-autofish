dnl SPDX-License-Identifier: GPL-3.0-or-later
dnl
divert(-1)

define(NAME, mikufish)
define(SWITCH_PREFAB, Assets/mikufish/switch.prefab)

define(ISOLATE_BEGIN, using NAME; namespace NAME {)
define(ISOLATE_END, })

divert(0)dnl
