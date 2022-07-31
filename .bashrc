# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/bashrc.pre.bash" ]] && . "$HOME/.fig/shell/bashrc.pre.bash"

# Name of this filepath.
self="~/.bashrc"
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
BASHRC_SOURCED=1
[ "$BASH_PROFILE_SOURCED" != 1 ] && vsource ~/.bash_profile $self
unset BASHRC_SOURCED
### End: bash ###

# [hh:mm:ss] username:pwd git-branch $
PS1='\[\e[0m\][\[\e[0m\]\t\[\e[0m\]] \[\e[0;92m\]\u\[\e[0m\]:\[\e[0;94m\]\w \[\e[0;96m\]$([ $(git config --get remote.origin.url) != git@github.com:emilte/home.git ] && git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2) \[\e[0m\]\n\$ \[\e[0m\]'
export PS1

### LS_COLORS ###
# See https://github.com/emilte/terminal for more.
EMIL_LS_COLORS=":di=94:"
CURRENT_LS_COLORS=$EMIL_LS_COLORS
LS_COLORS="${CURRENT_LS_COLORS}:" ; export LS_COLORS

# Prevent duplicate entries when browsing history in terminal.
export HISTCONTROL=ignoredups

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/bashrc.post.bash" ]] && . "$HOME/.fig/shell/bashrc.post.bash"