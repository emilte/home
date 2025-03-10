#!/usr/bin/env bash

# Doesn't seem to work on non-Intel Macs.

brew tap zackelia/formulae
brew install bclm
sudo bclm write 80
sudo bclm persist