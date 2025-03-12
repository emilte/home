#!/usr/bin/env bash

# Doesn't seem to work on non-Intel Macs.
function config-battery
	brew tap zackelia/formulae
	brew install bclm
	sudo bclm write 80
	sudo bclm persist
end