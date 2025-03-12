# Sets environment vars, e.g. HOMEBREW_PREFIX.
eval (/opt/homebrew/bin/brew shellenv)

# Recommended by brew.
set -gx LDFLAGS "-L/usr/local/opt/zlib/lib"
set -gx CPPFLAGS "-I/usr/local/opt/zlib/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/zlib/lib/pkgconfig"
# set -gx HOMEBREW_CACHE "$HOME/Projects/Caches/Homebrew" # Moved from "$HOME/Library/Caches/Homebrew".


# XDG
set -gx PROJECTS_HOME "$HOME/Projects" # Excluded by BDLDaemon (BitDefender) and Microsoft Defender.
set -gx REPOS "$PROJECTS_HOME/repos"
set -gx APPLICATION_SUPPORT "$HOME/Library/Application\ Support"
set -gx XDG_DATA_HOME "$HOME/.XDG_DATA_HOME" # https://stackoverflow.com/a/71733442/12616507 # https://pnpm.io/npmrc#store-dir
set -gx XDG_STATE_HOME "$HOME/.XDG_STATE_HOME" # https://pnpm.io/npmrc#state-dir
set -gx XDG_CACHE_HOME "$HOME/.XDG_CACHE_HOME" # https://github.com/abiosoft/colima/pull/736
set -gx XDG_CONFIG_HOME "$HOME/.XDG_CONFIG_HOME" # https://github.com/abiosoft/colima/pull/736

set -gx CYPRESS_CACHE_FOLDER "$XDG_CACHE_HOME/Cypress" # Moved from "~/Library/Caches/Cypress" https://docs.cypress.io/guides/references/advanced-installation#Binary-cache
set -gx RUSTUP_HOME "$PROJECTS_HOME/.rustup" # Moved from "~/.rustup" https://rust-lang.github.io/rustup/environment-variables.html

# Fish
set -gx FISH_CONFIG_HOME "$XDG_CONFIG_HOME/fish"
set -gx FISH_CONFIG_FILE "$FISH_CONFIG_HOME/config.fish"

# Dart
set -gx PUB_CACHE "$XDG_CACHE_HOME/.pub-cache" # Default: "~/.pub-cache" https://dart.dev/tools/pub/environment-variables

# pipenv
set -gx PIPENV_VENV_IN_PROJECT 1
set -gx LANG "en_GB.UTF-8"
set -gx PIPENV_CACHE_DIR "$XDG_CACHE_HOME/pipenv" # Moved from "~/Library/Caches/pipenv" https://github.com/pypa/pipenv/blob/main/docs/configuration.md#changing-cache-location

# lima/colima
set -gx LIMA_HOME "$XDG_CONFIG_HOME/.lima" # Moved from "~/.lima" https://lima-vm.io/docs/dev/internals/#lima-home-directory-lima_home

# pyenv
set -gx PYENV_ROOT "$HOME/.pyenv"

set -gx ITERM2_SCRIPTS $HOME/Library/Application\ Support/iTerm2/Scripts
