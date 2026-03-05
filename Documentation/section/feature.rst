.. SPDX-License-Identifier: GPL-3.0-or-later

===========
Mod Feature
===========

Mikufish is built for low-latency auto fishing with safe interruption.

- Reeling runs with near-zero delay after a bite is detected.
- Casting runs with zero delay.
- Hooking still works even if the game window is not focused.
- Opening the inventory automatically interrupts fishing.
- It works with the fishing mini-game enabled by skipping it automatically.
- You can |disable_mikufish| in-game any time to play the mini-game.
- You can control cast distance by |adjust_hold|.

State Safety
============

The fishing flow is implemented to avoid internal state corruption. No matter
what you do while fishing, it won't break.

.. |disable_mikufish| replace:: :doc:`disable auto fishing <user_manual>`

.. |adjust_hold| replace:: :doc:`adjusting the hold <user_manual>`
