#!/bin/sh
# SPDX-License-Identifier: GPL-3.0-or-later

set -e

dst=ck/sdk/Assets

ln -snf $PWD/core $dst/mikufish

find *.asset *.meta -exec realpath {} + | xargs -x ln -snft $dst
