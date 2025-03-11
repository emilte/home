# Sets environment vars, e.g. HOMEBREW_PREFIX.
eval (/opt/homebrew/bin/brew shellenv)

# Recommended by brew.
set -x LDFLAGS "-L/usr/local/opt/zlib/lib"
set -x CPPFLAGS "-I/usr/local/opt/zlib/include"
set -x PKG_CONFIG_PATH "/usr/local/opt/zlib/lib/pkgconfig"
# set -x HOMEBREW_CACHE "$HOME/Projects/Caches/Homebrew" # Moved from "$HOME/Library/Caches/Homebrew".

set -x PROJECTS_HOME "$HOME/Projects" # Excluded by BDLDaemon (BitDefender) and Microsoft Defender.
set -x REPOS "$PROJECTS_HOME/repos"
set -x APPLICATION_SUPPORT "$HOME/Library/Application\ Support"
set -x XDG_DATA_HOME "$HOME/.XDG_DATA_HOME" # https://stackoverflow.com/a/71733442/12616507 # https://pnpm.io/npmrc#store-dir
set -x XDG_STATE_HOME "$HOME/.XDG_STATE_HOME" # https://pnpm.io/npmrc#state-dir
set -x XDG_CACHE_HOME "$HOME/.XDG_CACHE_HOME" # https://github.com/abiosoft/colima/pull/736
set -x XDG_CONFIG_HOME "$HOME/.XDG_CONFIG_HOME" # https://github.com/abiosoft/colima/pull/736

set -x CYPRESS_CACHE_FOLDER "$XDG_CACHE_HOME/Cypress" # Moved from "~/Library/Caches/Cypress" https://docs.cypress.io/guides/references/advanced-installation#Binary-cache
set -x RUSTUP_HOME "$PROJECTS_HOME/.rustup" # Moved from "~/.rustup" https://rust-lang.github.io/rustup/environment-variables.html

# Dart
set -x PUB_CACHE "$XDG_CACHE_HOME/.pub-cache" # Default: "~/.pub-cache" https://dart.dev/tools/pub/environment-variables

# pipenv
set -x PIPENV_VENV_IN_PROJECT 1
set -x LANG "en_GB.UTF-8"
set -x PIPENV_CACHE_DIR "$XDG_CACHE_HOME/pipenv" # Moved from "~/Library/Caches/pipenv" https://github.com/pypa/pipenv/blob/main/docs/configuration.md#changing-cache-location

# lima/colima
set -x LIMA_HOME "$XDG_CONFIG_HOME/.lima" # Moved from "~/.lima" https://lima-vm.io/docs/dev/internals/#lima-home-directory-lima_home

# pyenv
set -x PYENV_ROOT "$PROJECTS_HOME/.pyenv"

set -x ITERM2_SCRIPTS "$HOME/Library/Application\ Support/iTerm2/Scripts"