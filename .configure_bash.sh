#!/bin/bash

### functions ###
function is_yes {
    [ "$1" = "y" ] || [ "$1" = "Y" ]
    return $?
}

function is_no {
    [ "$1" = "n" ] || [ "$1" = "N" ]
    return $?
}

function is_valid_answer {
    is_yes $1 || is_no $1
    return $?
}

function do_action {
    # $1: description
    # $2: string of chained commands
    # Utilises global 'interactive' to prompt user. Defaults to "y" if missing.
    should_ask=${interactive:="y"}

    # Ask to do action if interactive mode.
    if [ "$should_ask" = "y" ]; then
        echo
        while ! is_valid_answer $do_action_ans ; do
            read -p "$1 [y/n]: " do_action_ans
        done
        # Make lowercase.
        do_action_ans=`echo $do_action_ans | tr "[:upper:]" "[:lower:]"`
    else 
        do_action_ans="y"
    fi
    # Install if accepted.
    if [ "$do_action_ans" = "y" ]; then
        eval $2
    fi
}


# Change default terminal to bash.
chsh -s /bin/bash

# Initialise global 'interactive'.
interactive="$1"

# Get user input if missing 'interactive'.
echo
echo
while ! is_valid_answer $interactive ; do
    read -p "Install with interactive mode? [y/n]: " interactive
done
# Make lowercase.
interactive=`echo $interactive | tr "[:upper:]" "[:lower:]"` # https://stackoverflow.com/a/2264451/12616507

# Go to home directory.
cd ~
echo `pwd`

### brew ###
# Install brew if it doesn't exist.
if [ ! `which brew` ]; then
    # Non-interactive install.
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Update PATH and current shell.
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> $HOME/.bash_profile
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
# Update brew.
brew update -q && brew upgrade -q && brew upgrade -q --cask
brew install gcc -q # Recommended by brew.


### bitwarden ###
do_action "Install bitwarden-cli?" "brew install bitwarden-cli -q"


### wifi-password ###
do_action "Install wifi-password (requires MacOS)?" "brew install wifi-password -q"


### fig ###
# Autocompletion with GUI.
# https://fig.io/
# https://formulae.brew.sh/cask/fig
# https://github.com/withfig/fig
do_action "Install fig?" "brew install --cask fig -q"


### alt-tab ###
# Enables tabbing similar to Windows.
# https://alt-tab-macos.netlify.app/
do_action "Install alt-tab?" "brew install --cask alt-tab -q"


### docker ###
do_action "Install docker?" "brew install docker -q"


### colima ###
# Replacement for docker-desktop.
# https://github.com/abiosoft/colima
do_action "Install colima?" "brew install colima -q && colima start"


### ncdu ###
# Directory explorer.
do_action "Install ncdu?" "brew install ncdu -q"


### jq ###
# JSON processor for CLI.
# https://stedolan.github.io/jq/
do_action "Install jq?" "brew install jq -q"


### visual-studio-code ###
do_action "Install visual-studio-code?" "brew install visual-studio-code -q"


### bash-completion ###
do_action "Install bash-completion?" "brew install bash-completion -q"


### git ###
do_action "Install git?" "brew install git -q"


### pyenv ###
# Config already added to .bash_profile.
do_action "Install pyenv?" "git clone https://github.com/pyenv/pyenv.git ~/.pyenv"


### google-chrome ###
do_action "Install google-chrome?" "brew install --cask google-chrome -q"


### glab ###
do_action "Install glab?" "brew install glab -q"


### iterm2 ###
do_action "Install iterm2?" "brew install iterm2 -q"


### spotify ###
do_action "Install spotify?" "brew install spotify -q"


# Restart terminal
exec "$SHELL"