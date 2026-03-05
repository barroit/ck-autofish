#!/bin/sh
# SPDX-License-Identifier: GPL-3.0-or-later

set -e

mkdir -p .disasm

find ck/game/Managed -mindepth 1 -exec \
     xargs -x ilspycmd --project --outputdir .disasm {} +
