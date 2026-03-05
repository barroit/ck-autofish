#!/bin/sh
# SPDX-License-Identifier: GPL-3.0-or-later

set -e

version=$(git tag --sort=-version:refname | head -1)
archive=mikufish-$version.zip

cd ck/mod
zip -rq $archive .

cd ../..
mv ck/mod/$archive .
