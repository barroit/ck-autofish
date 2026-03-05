.. SPDX-License-Identifier: GPL-3.0-or-later

===========
User Manual
===========

This mod is dead simple. The only thing you can configure is how long it holds
the interaction button after a fish bites.

There's an in-game button to enable or disable auto fishing. It's on the right
side of your inventory, opposite the trashcan.

You can still edit the configuration file directly for ``hold``.

Configuration File
==================

The configuration file is :file:`mikufish.json`. Its location depends on how you
run the game:

Windows
	|path_win|

Linux
	|path_linux|

Linux with Proton
	|path_proton|

Replace ``<user>`` with your Steam user ID.

File Format
===========

The file uses this schema::

	{
	    "__enabled": true,
	    "hold": 0.20000000298023225
	}

``__enabled`` is managed by the mod. Don't edit it in the file. Mikufish
overwrites this value. Use the in-game button to change enable or disable state.

``hold`` is the duration, in seconds, that the mod activates the interaction
button after it detects a fish biting the bait.

Defaults
========

The default value of ``hold`` is ``0.2`` seconds.

In this game, if you keep holding the interact button after reeling, the rod
immediately re-casts. A higher ``hold`` value means a longer hold, so the hook
is cast farther.

The mod loads and saves configuration every time you enter or exit a world. You
don't need to restart the game for changes to take effect.

.. |path_win| replace:: :file:`$env:USERPROFILE/AppData/LocalLow/Pugstorm/\
			       Core\` Keeper/Steam/<user>/mods/mikufish.json`

.. |path_linux| replace:: :file:`$HOME/.config/unity3d/Pugstorm/\
				 Core\\ Keeper/Steam/<user>/mods/mikufish.json`

.. |path_proton| replace:: :file:`/path/to/game/../../compatdata/1621690/pfx/\
				  drive_c/users/steamuser/AppData/LocalLow/\
				  Pugstorm/Core\\ Keeper/Steam/<user>/mods/\
				  mikufish.json`
