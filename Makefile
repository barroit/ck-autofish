# SPDX-License-Identifier: GPL-3.0-or-later

m4 ?= m4
onchange ?= onchange

m4-in := $(wildcard core-script/*.m4)
patch-m4  := core-script/patch.m4
helper-m4 := $(filter-out $(patch-m4),$(m4-in))

script-in := $(wildcard core-script/*.cs)
script-y  := $(subst -script,,$(script-in))

icon-in := images/rod.png
icon-y  := $(subst images,core,$(icon-in))

.PHONY: pp

pp: $(script-y) $(icon-y)

$(script-y): core/%: core-script/% $(m4-in)
	$(m4) $(patch-m4) $(helper-m4) $< >$@

$(icon-y): core/%: images/%
	cp $< $@

.PHONY: hot-pp

hot-pp: pp
	$(onchange) 'core-script/*' -- $(MAKE) pp

.PHONY: clean

clean:
	rm -f $(script-y) $(icon-y)
