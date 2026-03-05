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

define(__entctl_get_cd, $1.GetComponentData<$2>($3))
define(__entctl_set_cd, [[$1.SetComponentData($2, $3)]])
define(__entctl_mk_single, $1.CreateSingleton<$2>())

define(entctl_get_cd, __entctl_get_cd(EntityManager, $1, $2))
define(entctl_set_cd, __entctl_set_cd(EntityManager, $1, $2))
define(entctl_mk_single, __entctl_mk_single(EntityManager, $1))

define(ec_rw_of, SystemAPI.GetComponentRW<$1>($2))
define(ec_ro_of, SystemAPI.GetComponent<$1>($2))
define(ec_single, SystemAPI.GetSingleton<$1>())
define(ec_single_rw, SystemAPI.GetSingletonRW<$1>())

define(uu_cast, [[UnsafeUtility.As<$1, $2>($3)]])

define(ui_has_inv, Manager.ui.isAnyInventoryShowing)
define(ui_has_player_inv, Manager.ui.isPlayerInventoryShowing)
define(ui_has_menu, Manager.menu.IsAnyMenuActive())
define(ui_player_inv, ((InventoryUI)Manager.ui.playerInventoryUI))

define(mod_fs, API.ConfigFilesystem)
define(mod_ctl, ((ModAPIModLoader)API.ModLoader))

define(FISHING_ROD_SLOT, EquipmentSlotType.FishingRodSlot)

define(BTN_STATE, CommandInputButtonStateNames)
define(RMB_HELD, SecondInteract_HeldDown)

divert(0)dnl
