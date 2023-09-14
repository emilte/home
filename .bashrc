#!/usr/bin/env bash

# Name of this filepath.
# shellcheck disable=SC2088
self="~/.bashrc"
echo
echo "=== $self ==="


### functions ###
function vsource {
	# Verbose source of path if it exists.
	# Usage: vsource <PATH> <FROM>
	# Example: vsource ~/.bashrc "here"
	arg_path=$1
	arg_from=$2 ; arg_from=${arg_from:=$(pwd)} # Set default parameter if missing.
	# shellcheck disable=SC1090
	[ -f "$arg_path" ] && echo "Sourcing $arg_path" && . "$arg_path"
}

function is_yes {
	ans=$(echo "$1" | tr "[:upper:]" "[:lower:]") # To lowercase.
    [ "$ans" = "y" ] || [ "$ans" = "yes" ]
    return $?
}

### End: functions ###


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
PS1='\[\e[0m\][\[\e[0m\]\t\[\e[0m\]] \[$(tput setaf 10)\]\u\[$(tput setaf 250)\]@\[$(tput setaf 201)\]\h\[\e[0m\]:\[\e[0;94m\]\w \[\e[0;96m\]$([ "$(git config --get remote.origin.url)" != "git@github.com:emilte/home.git" ] && git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2) \[\e[0;90m\]($(python -V)) \n\[$(tput setaf 9)\] \$ \[\e[0m\]'
# shellcheck disable=2090
export PS1

### LS_COLORS ###
# See https://github.com/emilte/terminal for more.
EMIL_LS_COLORS=":di=94:"
CURRENT_LS_COLORS="$EMIL_LS_COLORS"
LS_COLORS="${CURRENT_LS_COLORS}:" ; export LS_COLORS

# Prevent duplicate entries when browsing history in terminal.
export HISTCONTROL=ignoredups

### upgrade ###
# Should be last thing to happen to avoid cmd+C.
echo;
read -r -p "Run brew update and brew upgrade? [y/N]: " ans
is_yes "$ans" && brew update && brew upgrade;


source /Users/emil/.config/broot/launcher/bash/br
