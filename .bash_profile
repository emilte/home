#!/usr/bin/env bash

# Name of this filepath.
# shellcheck disable=SC2088
self="~/.bash_profile"
echo
echo "=== $self ==="

### functions ###
function vsource {
	# Verbose source of path if it exists.
	# Usage: vsource <PATH> <FROM>
	# Example: vsource ~/.bashrc "here"
	arg_path=$1
	arg_from=$2 ; arg_from=${arg_from:=$("pwd")} # Set default parameter if missing.
	# shellcheck disable=SC1090
	[ -f "$arg_path" ] && echo "Sourcing $arg_path" && source "$arg_path"
}

function prepend_path {
	# Prepends some path to PATH, but prevents duplicates.
	arg_path=$1 # some path
	[ "${PATH#*"$arg_path":}" == "$PATH" ] && export PATH="$arg_path:$PATH"
}
### End: functions ###


### bash ###
# Prevent infinite source loop.
export BASH_PROFILE_SOURCED=1
[ "$BASHRC_SOURCED" != 1 ] && vsource ~/.bashrc $self
unset BASH_PROFILE_SOURCED
vsource ~/.bash_secret $self # Excluded from version control.
vsource /usr/local/etc/bash_completion $self # Loads all other completions.

# Recommended by brew.
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"
# export HOMEBREW_CACHE="$HOME/Projects/Caches/Homebrew" # Moved from "$HOME/Library/Caches/Homebrew".
### End: bash ###

### Generic ###
export PROJECTS_HOME="$HOME/Projects" # Excluded by BDLDaemon.
export REPOS="$PROJECTS_HOME/repos"
export APPLICATION_SUPPORT="$HOME/Library/Application\ Support"
export XDG_DATA_HOME="$PROJECTS_HOME/.XDG_DATA_HOME" # https://stackoverflow.com/a/71733442/12616507 # https://pnpm.io/npmrc#store-dir
export XDG_STATE_HOME="$PROJECTS_HOME/.XDG_STATE_HOME" # https://pnpm.io/npmrc#state-dir
export XDG_CACHE_HOME="$PROJECTS_HOME/.XDG_CACHE_HOME" # https://github.com/abiosoft/colima/pull/736
export XDG_CONFIG_HOME="$PROJECTS_HOME/.XDG_CONFIG_HOME" # https://github.com/abiosoft/colima/pull/736
### End: Generic ###

export CYPRESS_CACHE_FOLDER="$XDG_CACHE_HOME/Cypress" # Moved from "~/Library/Caches/Cypress" https://docs.cypress.io/guides/references/advanced-installation#Binary-cache
export RUSTUP_HOME="$PROJECTS_HOME/.rustup" # Moved from "~/.rustup" https://rust-lang.github.io/rustup/environment-variables.html


### Dart ###
export PUB_CACHE="$XDG_CACHE_HOME/.pub-cache" # Default: "~/.pub-cache" https://dart.dev/tools/pub/environment-variables
### End: Dart ###

### git ###
# vsource ~/.git-completion.bash $self
### End: git ###

### glab ###
# shellcheck disable=SC2046,SC1090,SC2006
# [ `which glab` ] && eval "$(glab completion -s bash)"
### End: glab ###


### ALIAS ###
vsource ~/.bash_aliases $self
### End: ALIAS ###

### pipenv ###
export PIPENV_VENV_IN_PROJECT=1
export LANG="en_US.UTF-8"
export PIPENV_CACHE_DIR="$XDG_CACHE_HOME/pipenv" # Moved from "~/Library/Caches/pipenv" https://github.com/pypa/pipenv/blob/main/docs/configuration.md#changing-cache-location
### End: pipenv ###


### lima/colima ###
# shellcheck disable=SC2046,SC1090
# [ $(which colima) ] && source <(colima completion bash)

export LIMA_HOME="$PROJECTS_HOME/.lima" # Moved from "~/.lima" https://lima-vm.io/docs/dev/internals/#lima-home-directory-lima_home
### End: colima ###


### pyenv ###
export PYENV_ROOT="$PROJECTS_HOME/.pyenv"
# prepend_path "$PYENV_ROOT/bin"
# prepend_path "$PYENV_ROOT/shims"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
### End: pyenv ###

### ruby ###
# if command -v rbenv 1>/dev/null 2>&1; then
# 	eval "$(rbenv init - bash)"
# fi
### End: ruby ###

# iterm2 shell integration.
prepend_path "/usr/local/sbin"
# shellcheck disable=SC1091
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# MacOS
# https://macos-defaults.com/finder/_fxsortfoldersfirst.html#set-to-true
#  $ defaults write com.apple.finder "AppleShowAllFiles" -bool "true" && killall Finder
#  $ defaults write com.apple.finder "ShowPathbar" -bool "true" && killall Finder
#  $ defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true" && killall Finder

# shellcheck disable=SC1091
source /Users/emil/.config/broot/launcher/bash/br
# shellcheck disable=SC1091
. "$HOME/.cargo/env" 


### Packages ###
# ncdu
# htop
# broot
# jq
# pyenv
# colima
# glab

# burp-suite