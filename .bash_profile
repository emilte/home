# Fig pre block. Keep at the top of this file.
. "$HOME/.fig/shell/bash_profile.pre.bash"

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
vsource ~/.bashrc $self
vsource /usr/local/etc/bash_completion $self
### End: bash ###


### git ###
vsource ~/.git-completion.bash $self
### End: git ###


### glab ###
eval "$(glab completion -s bash)"
### End: glab ###


### ALIAS ###
# ls (but everything).
alias la='ls -la'

# Add colors to grep.
alias grep="/usr/bin/grep --color=auto"
### End: ALIAS ###


### pipenv ###
export PIPENV_VENV_IN_PROJECT=1
export LANG="en_US.UTF-8"
# resolves bug with psycopg2
export LDFLAGS="-L/usr/local/opt/openssl/lib" 
export CPPFLAGS="-I/usr/local/opt/openssl/include"
### End: pipenv ###


### pyenv ###
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/shims:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
### End: pyenv ###

export PATH="/usr/local/sbin:$PATH"

# Fig post block. Keep at the bottom of this file.
. "$HOME/.fig/shell/bash_profile.post.bash"
