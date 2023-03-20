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
### End: bash ###


### git ###
# vsource ~/.git-completion.bash $self
### End: git ###

### glab ###
# shellcheck disable=SC2046,SC1090,SC2006
# [ `which glab` ] && eval "$(glab completion -s bash)"
### End: glab ###


### ALIAS ###
alias la="ls -la" # ls (but everything).
alias ..="cd .."
alias ...="cd ../.."
alias grep="grep --color=auto" # Add colors to grep.
alias projects="cd ~/my-projects"
alias dc="docker compose"
alias staging="open https://feide-kp-staging.paas2.uninett.no/"
alias prod="open https://kunde.feide.no/"
alias sentry="open https://sentry.feide.no/organizations/feide/issues/?environment=production&project=2&query=is%3Aunresolved&referrer=issue-list&statsPeriod=14d"
alias samf="cd ~/my-projects/Samfundet"
alias rekenett="cd ~/my-projects/rekenett"
alias feide="cd ~/my-projects/feide-kp"
alias samf4="cd ~/my-projects/Samfundet4"
alias django="python -m pipenv run python manage.py"
alias makemigrations="python -m pipenv run python manage.py makemigrations"
alias migrate="python -m pipenv run python manage.py migrate"
### End: ALIAS ###

### pipenv ###
export PIPENV_VENV_IN_PROJECT=1
export LANG="en_US.UTF-8"
### End: pipenv ###


### colima ###
# shellcheck disable=SC2046,SC1090
# [ $(which colima) ] && source <(colima completion bash)
### End: colima ###


### pyenv ###
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/shims:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
### End: pyenv ###

### ruby ###
if command -v rbenv 1>/dev/null 2>&1; then
	eval "$(rbenv init - bash)"
fi
### End: ruby ###

# iterm2 shell integration.
export PATH="/usr/local/sbin:$PATH"
# shellcheck disable=SC1091
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# MacOS
# https://macos-defaults.com/finder/_fxsortfoldersfirst.html#set-to-true
#  $ defaults write com.apple.finder "AppleShowAllFiles" -bool "true" && killall Finder
#  $ defaults write com.apple.finder "ShowPathbar" -bool "true" && killall Finder
#  $ defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true" && killall Finder

source /Users/emil/.config/broot/launcher/bash/br
