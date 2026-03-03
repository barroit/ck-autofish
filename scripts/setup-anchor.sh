#!/bin/sh
# SPDX-License-Identifier: GPL-3.0-or-later

set -e

dirvdf=$HOME/.local/share/Steam/steamapps/libraryfolders.vdf

steam=$(awk -F'"' '/"path"/ {print $4}' $dirvdf)
steamapps=$(printf '%s/steamapps ' $steam)

appacf=$(find $steamapps -maxdepth 1 -name appmanifest_1621690.acf -print -quit)
anchor=$(dirname $appacf)

test -n "$anchor"

ln -snf $anchor .anchor
