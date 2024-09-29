#!/usr/bin/env bash

# Name of this filepath.
# shellcheck disable=SC2088
self="~/.bashrc"
echo
echo "=== $self ==="

# shellcheck disable=SC1090
source ~/.bash_utils


### bash ###
# Prevent infinite source loop.
export BASHRC_SOURCED=1
[ "$BASH_PROFILE_SOURCED" != 1 ] && vsource ~/.bash_profile $self
unset BASHRC_SOURCED
### End: bash ###

# Reclaim ownership of files from brew.
# https://github.com/orgs/Homebrew/discussions/633
# find /opt/homebrew/Cellar -user root | xargs sudo chown -R $USER
# sudo chown -R "$USER" "$(brew --prefix)/Cellar"


# https://robotmoon.com/bash-prompt-generator/
# [hh:mm:ss] username:pwd git-branch $
# shellcheck disable=2089
PS1_COLOR_RESET='\[\e[0m\]'
# PS1='\[\e[0;90m\]($(pyenv version-name)) \[\e[0;91m\]$( is-kp && echo "(pnpm $(pnpm -v))") \[\e[0;91m\]$( is-samf4 && echo "(yarn $(yarn -v))") \n\[\e[0m\][\[\e[0m\]\t\[\e[0m\]] \[$(tput setaf 10)\]\u\[$(tput setaf 250)\]@\[$(tput setaf 201)\]\h\[\e[0m\]:\[\e[0;94m\]\w \[\e[0;96m\]$( git is-repo && (is-home || git current)) \n\[$(tput setaf 9)\] \$ \[\e[0m\]' # advanced, and slow...
PS1="[\t]\[$(tput setaf 10)\]\u\[$(tput setaf 250)\]@\[$(tput setaf 201)\]\h$PS1_COLOR_RESET:\[\e[0;94m\]\w \[\e[0;96m\]\$( git is-repo && (is-home || git current)) \n \[$(tput setaf 9)\]\$ $PS1_COLOR_RESET" # simple
# shellcheck disable=2090
export PS1

### LSCOLORS ###
# This seems to be config for MacOS.
export CLICOLOR=1 # Enable colorized output (MacOS).
export LSCOLORS=fagxcxdxbxegedabagacad # https://geoff.greer.fm/lscolors/
### End: LSCOLORS ###

### LS_COLORS ###
# See https://github.com/emilte/terminal for more.
EMIL_LS_COLORS="di=35;40:ln=36:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
# export LS_COLORS='di=0;35:' ls -la
# export LS_COLORS=$LS_COLORS:'di=0;35:'; ls -la
# export LS_COLORS=$CURRENT_LS_COLORS
export LS_COLORS=$EMIL_LS_COLORS
### End: LS_COLORS ###

# Prevent duplicate entries when browsing history in terminal.
export HISTCONTROL=ignoredups

# export ANDROID_HOME="/usr/local/share/android-commandlinetools"
export ANDROID_HOME="$HOME/Library/Android/sdk"
# export PATH=$PATH:/usr/local/share/android-commandlinetools/cmdline-tools/latest/bin/sdkmanager


source /Users/emil/.config/broot/launcher/bash/br
. "$HOME/.cargo/env"
