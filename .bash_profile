# Fig pre block. Keep at the top of this file.
. "$HOME/.fig/shell/bash_profile.pre.bash"

echo "Sourcing ~/.bash_profile"

# Source ~/.bashrc if exists.
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Source bash_completion if exists.
if [ -f /usr/local/etc/bash_completion ]; then
	. /usr/local/etc/bash_completion
fi

### git ###
# Source git-completion.bash if exists.
if [ -f ~/.git-completion.bash ]; then
	. ~/.git-completion.bash
fi
### End: git ###


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
