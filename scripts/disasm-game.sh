#!/bin/sh
# SPDX-License-Identifier: GPL-3.0-or-later

set -e

trap 'rm -f .tmp-$$' EXIT

cat <<-'EOF' | sed s,^,/, >.tmp-$$
	0Harmony.dll
	Accessibility.dll
	Assembly-CSharp-firstpass.dll
	Autodesk*
	CgSDK.dll
	Discord.SDK.dll
	DomainReloadHelper.Runtime.dll
	Facepunch.Steamworks.Win64.dll
	FewesLight.dll
	I2.dll
	Microsoft*
	Mono*
	NaughtyAttributes*
	Newtonsoft.Json.dll
	PimDeWitte.UnityMainThreadDispatcher.dll
	PlayFab*
	QFSW*
	Rewired*
	RoslynCSharp*
	Sentry*
	System*
	Trivial*
	Unity*
	XblPCSandbox.dll
	bilibili.OpenBLive.dll
	io.sentry.unity.runtime.dll
	mcs.dll
	modio*
	mscorlib.dll
	netstandard.dll
EOF

mkdir -p .disasm

find ck/game/Managed -mindepth 1 | grep -vf .tmp-$$ | \
xargs -x ilspycmd --project --outputdir .disasm
