# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/bash_profile.pre.bash" ]] && . "$HOME/.fig/shell/bash_profile.pre.bash"

# Name of this filepath.
self="~/.bash_profile"
echo
echo "=== $self ==="


### functions ###
function vsource {
	# Verbose source of path if it exists.
	# Usage: vsource <PATH> <FROM>
	# Example: vsource ~/.bashrc "here"
	arg_path=$1
	arg_from=$2 ; arg_from=${arg_from:=`pwd`} # Set default parameter if missing.
	[ -f $arg_path ] && echo "Sourcing $arg_path" && . $arg_path
}
### End: functions ###


### bash ###
# Prevent infinite source loop.
BASH_PROFILE_SOURCED=1
[ "$BASHRC_SOURCED" != 1 ] && vsource ~/.bashrc $self
unset BASH_PROFILE_SOURCED
[ "$BASHRC_SOURCED" != 1 ] && vsource ~/.bash_secret $self # Excluded from version control.
vsource /usr/local/etc/bash_completion $self
### End: bash ###


### git ###
vsource ~/.git-completion.bash $self
### End: git ###


### glab ###
[ `which glab` ] && eval "$(glab completion -s bash)"
### End: glab ###


### ALIAS ###
# ls (but everything).
alias la='ls -la'
# Add colors to grep.
alias grep="grep --color=auto"
alias projects="cd ~/my-projects"
### End: ALIAS ###


### pipenv ###
export PIPENV_VENV_IN_PROJECT=1
export LANG="en_US.UTF-8"
# resolves bug with psycopg2
export LDFLAGS="-L/usr/local/opt/openssl/lib" 
export CPPFLAGS="-I/usr/local/opt/openssl/include"
### End: pipenv ###


### colima ###
[ `which colima` ] && source <(colima completion bash)
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
if command -v pyenv 1>/dev/null 2>&1; then
	eval "$(rbenv init - bash)"
fi
### End: ruby ###

# iterm2 shell integration.
export PATH="/usr/local/sbin:$PATH"
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/bash_profile.post.bash" ]] && . "$HOME/.fig/shell/bash_profile.post.bash"
