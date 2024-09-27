#! /bin/bash

echo "Sourcing ~/.profile"

export PIPENV_VENV_IN_PROJECT=1
. "$HOME/.cargo/env"

# NOTES:
# /Library/LaunchAgents:
# sudo mv net.Printix.UI.plist net.Printix.UI.plist.bak

