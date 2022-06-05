# Fig pre block. Keep at the top of this file.
. "$HOME/.fig/shell/bashrc.pre.bash"


# Name of this filepath.
self="~/.bashrc"
echo
echo "=== $self ==="

# [hh:mm:ss] username:pwd git-branch $
PS1='\[\e[0m\][\[\e[0m\]\t\[\e[0m\]] \[\e[0;92m\]\u\[\e[0m\]:\[\e[0;94m\]\w \[\e[0;96m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2) \[\e[0m\]$ \[\e[0m\]'
export PS1

### LS_COLORS ###
# See https://github.com/emilte/terminal for more.
EMIL_LS_COLORS=":di=94:"
CURRENT_LS_COLORS=$EMIL_LS_COLORS
LS_COLORS="${CURRENT_LS_COLORS}:" ; export LS_COLORS

# Prevent duplicate entries when browsing history in terminal.
export HISTCONTROL=ignoredups

# Fig post block. Keep at the bottom of this file.
. "$HOME/.fig/shell/bashrc.post.bash"
