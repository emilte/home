#! /bin/bash

echo "Sourcing ~/.profile"

export PIPENV_VENV_IN_PROJECT=1
. "$HOME/.cargo/env"
