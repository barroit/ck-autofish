# SPDX-License-Identifier: GPL-3.0-or-later

m4 ?= m4
onchange ?= onchange

helper-m4 := $(wildcard fishing-script/*.m4)
script-in := $(wildcard fishing-script/*.cs)
script-y  := $(subst -script,,$(script-in))

.PHONY: pp

pp:

$(script-y): fishing%: fishing-script%
	$(m4) $(helper-m4) $< >$@

pp: $(script-y)

.PHONY: hot-pp

hot-pp: pp
	$(onchange) 'fishing-script/*' -- $(MAKE) pp

.PHONY: clean

clean:
	rm -f $(script-y)
