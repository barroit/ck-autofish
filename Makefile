# SPDX-License-Identifier: GPL-3.0-or-later

m4 ?= m4
onchange ?= onchange

m4-in := $(wildcard core-script/*.m4)
patch-m4  := core-script/patch.m4
helper-m4 := $(filter-out $(patch-m4),$(m4-in))

script-in := $(wildcard core-script/*.cs)
script-y  := $(subst -script,,$(script-in))

.PHONY: pp

pp: $(script-y)

$(script-y): core%: core-script% $(m4-in)
	$(m4) $${NDEBUG:+-DNDEBUG} $(patch-m4) $(helper-m4) $< >$@

.PHONY: hot-pp

hot-pp: pp
	$(onchange) 'core-script/*' -- $(MAKE) pp

.PHONY: clean

clean:
	rm -f $(script-y)
