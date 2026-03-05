#!/bin/sh
# SPDX-License-Identifier: GPL-3.0-or-later

set -e

trap 'rm -f .tmp-$$' EXIT

cd .assets/ExportedProject/Assets

cat <<-EOF | xargs tar -cf .tmp-$$
	AnimationClip
	AnimatorController
	AnimatorOverrideController
	Font
	Material
	MonoBehaviour
	Scenes
	Shader
	Sprite
	Texture2D
EOF

cd ../../..
mv .assets/ExportedProject/Assets/.tmp-$$ ck/sdk/Assets

cd ck/sdk/Assets
tar -xf .tmp-$$
