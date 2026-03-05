.. SPDX-License-Identifier: GPL-3.0-or-later

=======
Hacking
=======

This is not a tutorial. It explains how this repository is wired and what you
need to keep it working. It does not replace reading the source.

Overview
========

This repository does not follow the official Core Keeper mod SDK workflow.

This tree relies on GNU make, ``m4``, and symlinks. In practice, that means
Linux. Windows is not a realistic development environment for this repository.
Do not expect a normal IDE workflow either.

Builds are not guaranteed on every Linux distribution. Most work in this
repository happens on Ubuntu 24.04.

The ``m4`` step lets the C# sources use macros. That removes some repetition
and makes the code less annoying to maintain.

Required Layout
===============

This repository expects ``../ck-mod-sdk`` to exist next to it. ``ck/sdk`` is a
symlink to that tree. If the SDK is missing, nothing useful works.

Setup
=====

``scripts/setup-anchor.sh`` creates the ``.anchor`` symlink. The symlinks
under ``ck/`` depend on it.

``scripts/setup-repo.sh`` links ``core/`` into ``ck/sdk/Assets/mikufish``. It
also links the top-level ``*.asset`` and ``*.meta`` files into
``ck/sdk/Assets``.

``scripts/setup-assets.sh`` moves exported game assets into ``ck/sdk/Assets``
for SDK-side use.

``scripts/disasm-game.sh`` disassembles managed game code from
``ck/game/Managed`` into ``.disasm/``.

Source Layout
=============

Place Unity C# source files under ``core-script/``.

Place everything else that Unity imports under ``core/``.

Preprocessing
=============

There are two make targets for Unity script preprocessing: ``pp`` and
``hot-pp``.

``pp`` runs ``m4`` on the files in ``core-script/`` and writes the generated
``.cs`` files into ``core/``.

``hot-pp`` runs ``pp`` and then watches ``core-script/`` for changes so the
generated files stay current while you edit.

The generated Unity scripts go into ``core/`` on purpose.

Unity creates and updates ``.meta`` files next to imported files. This
repository tracks those ``.meta`` files in Git. By generating the processed C#
files into ``core/`` and then linking ``core/`` into the SDK tree, Unity can
create or update the matching ``.meta`` files where Git can see them.
