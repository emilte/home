#!/usr/bin/env bash

# Name of this filepath.
# shellcheck disable=SC2088
self="~/.bash_profile"
echo
echo "=== $self ==="

# Sets environment vars, e.g. HOMEBREW_PREFIX.
eval "$(/opt/homebrew/bin/brew shellenv)"

export BASH_COMPLETIONS_FOLDER="$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"

# shellcheck disable=SC1090

### bash ###
source ~/.bash_utils
vsource ~/.bash_aliases $self
vsource ~/.bash_secret $self # Excluded from version control.
vsource "$BASH_COMPLETIONS_FOLDER" $self # Loads all other completions.
# vsource ~/.bash_command_prompt $self

export BASH_PROFILE_SOURCED=1 # Prevent infinite source loop. .bashrc sources this file.
[ "$BASHRC_SOURCED" != 1 ] && vsource ~/.bashrc $self
unset BASH_PROFILE_SOURCED


# Recommended by brew.
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"
# export HOMEBREW_CACHE="$HOME/Projects/Caches/Homebrew" # Moved from "$HOME/Library/Caches/Homebrew".
### End: bash ###

### Generic ###
export PROJECTS_HOME="$HOME/Projects" # Excluded by BDLDaemon (BitDefender) and Microsoft Defender.
export REPOS="$PROJECTS_HOME/repos"
export APPLICATION_SUPPORT="$HOME/Library/Application\ Support"
export XDG_DATA_HOME="$HOME/.XDG_DATA_HOME" # https://stackoverflow.com/a/71733442/12616507 # https://pnpm.io/npmrc#store-dir
export XDG_STATE_HOME="$HOME/.XDG_STATE_HOME" # https://pnpm.io/npmrc#state-dir
export XDG_CACHE_HOME="$HOME/.XDG_CACHE_HOME" # https://github.com/abiosoft/colima/pull/736
export XDG_CONFIG_HOME="$HOME/.XDG_CONFIG_HOME" # https://github.com/abiosoft/colima/pull/736
### End: Generic ###

export CYPRESS_CACHE_FOLDER="$XDG_CACHE_HOME/Cypress" # Moved from "~/Library/Caches/Cypress" https://docs.cypress.io/guides/references/advanced-installation#Binary-cache
export RUSTUP_HOME="$PROJECTS_HOME/.rustup" # Moved from "~/.rustup" https://rust-lang.github.io/rustup/environment-variables.html


# export COLIMA_HOME="$XDG_CONFIG_HOME/.colima" # Moved from "~/.colima"

### Dart ###
export PUB_CACHE="$XDG_CACHE_HOME/.pub-cache" # Default: "~/.pub-cache" https://dart.dev/tools/pub/environment-variables
### End: Dart ###

### git ###
# vsource ~/.git-completion.bash $self
# [[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
### End: git ###

### glab ###
# shellcheck disable=SC2046,SC1090,SC2006
# [ `which glab` ] && eval "$(glab completion -s bash)"
### End: glab ###


### upgrade ###
# Should be last thing to happen to avoid ctrl+C.
echo
if random-success 10; then
	echo-red "Run brew update and brew upgrade?"
	read -t 8 -r -p "[y/N]: " ans
	# read -t 2 -r -p "Run brew update and brew upgrade? [y/N]: " ans # -t timeout 2 sec
	if is_yes "$ans"; then
		brew-up && brew outdated --greedy;
		echo 
		echo "brew upgrade <cask>"
		echo "or"
		echo "brew upgrade --greedy"
	fi
fi
### End: upgrade ###


### pipenv ###
export PIPENV_VENV_IN_PROJECT=1
# export LANG="en_US.UTF-8"
export LANG="en_GB.UTF-8"
export PIPENV_CACHE_DIR="$XDG_CACHE_HOME/pipenv" # Moved from "~/Library/Caches/pipenv" https://github.com/pypa/pipenv/blob/main/docs/configuration.md#changing-cache-location
### End: pipenv ###


### lima/colima ###
# shellcheck disable=SC2046,SC1090
# [ $(which colima) ] && source <(colima completion bash)

export LIMA_HOME="$XDG_CONFIG_HOME/.lima" # Moved from "~/.lima" https://lima-vm.io/docs/dev/internals/#lima-home-directory-lima_home
### End: colima ###


### pyenv ###
export PYENV_ROOT="$PROJECTS_HOME/.pyenv"
# export PYENV_ROOT="$XDG_CONFIG_HOME/.pyenv"
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

### nodenv ###
if command -v nodenv 1>/dev/null 2>&1; then
	eval "$(nodenv init - bash)"
fi
### End: nodenv ###



### mise ###
if command -v mise 1>/dev/null 2>&1; then
	echo Activating mise
	eval "$(mise activate bash)"
fi
### End: mise ###


# iterm2 shell integration.
prepend_path "/usr/local/sbin"
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# MacOS
# https://macos-defaults.com/finder/_fxsortfoldersfirst.html#set-to-true
#  $ defaults write com.apple.finder "AppleShowAllFiles" -bool "true" && killall Finder
#  $ defaults write com.apple.finder "ShowPathbar" -bool "true" && killall Finder
#  $ defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true" && killall Finder

# source /Users/emil/.config/broot/launcher/bash/br
. "$HOME/.cargo/env" 


