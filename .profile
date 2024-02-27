#! /bin/bash

echo "Sourcing ~/.profile"

export PIPENV_VENV_IN_PROJECT=1
# shellcheck disable=SC1091
. "$HOME/.cargo/env"
