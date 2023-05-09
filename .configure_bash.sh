#!/bin/bash

### Imports ###
[ -f ~/.bash_profile ] && echo "Sourcing ~/.bash_profile" && . ~/.bash_profile
### End: Imports ###

### functions ###
function is_yes {
	ans=$(echo "$1" | tr "[:upper:]" "[:lower:]") # To lowercase.
    [ "$ans" = "y" ] || [ "$ans" = "yes" ]
    return $?
}

function is_no {
    [ "$1" = "n" ] || [ "$1" = "N" ]
    return $?
}

function is_valid_answer {
    is_yes "$1" || is_no "$1"
    return $?
}

# https://apple.stackexchange.com/questions/34810/create-a-command-to-focus-a-specific-window-from-anywhere-in-os
# function notify
# https://apple.stackexchange.com/a/115373

function do_action {
    # $1: description.
    # $2: string of chained commands.
    # $3: interactive mode "y" or "n".
    # Utilises global 'X_INTERACTIVE' to prompt user. Defaults to "y" if missing.
    interactive=$3
    should_ask=${interactive:="y"}

    # Ask to do action if interactive mode.
    if [ "$should_ask" = "y" ]; then
        echo
        while ! is_valid_answer "$do_action_ans" ; do
            read -r -p "$1 [y/n]: " do_action_ans
        done
        # Make lowercase.
        do_action_ans=$(echo "$do_action_ans" | tr "[:upper:]" "[:lower:]")
    else 
        do_action_ans="y"
    fi
    # Install if accepted.
    if [ "$do_action_ans" = "y" ]; then
        eval "$2"
    fi
}


# OS
[[ "$OSTYPE" == "darwin"* ]] ; IS_MAC=$?
[[ "$OSTYPE" == "linux-gnu"* ]] ; IS_UBUNTU=$?

# Attempt to install requirements first.
# https://github.com/pyenv/pyenv/wiki#suggested-build-environment
echo ; echo ; echo ; echo "==============================================================="
if [ $IS_UBUNTU == 0 ]; then
    [ ! "$(which sudo)" ] && apt install -y sudo
    do_action "Attempt to install requirements (build-essential, procps, curl, file, git, ssh)" "sudo apt update -y ; sudo apt upgrade -y ; sudo apt install -y build-essential procps curl file git ssh" "$X_INTERACTIVE"
elif [ $IS_MAC == 0 ]; then
    do_action "Attempt to install requirements (curl, git)" "brew install git curl" "$X_INTERACTIVE"
    do_action "Install xcode-select" "xcode-select --install" "$X_INTERACTIVE"
fi


# Change default terminal to bash.
chsh -s /bin/bash

# Initialise global 'X_INTERACTIVE'. Defaults to "y".
X_INTERACTIVE=${X_INTERACTIVE:="y"}
echo "X_INTERACTIVE=$X_INTERACTIVE"
echo

# Get user input if missing 'interactive'.
echo
echo
while ! is_valid_answer "$X_INTERACTIVE" ; do
    read -r -p "Install with interactive mode? [y/n]: " X_INTERACTIVE
done
# Make lowercase.
X_INTERACTIVE=$(echo "$X_INTERACTIVE" | tr "[:upper:]" "[:lower:]") # https://stackoverflow.com/a/2264451/12616507

# Go to home directory.
cd ~ || exit
pwd

### brew ###
# Install brew if it doesn't exist.
if [ ! "$(which brew)" ]; then
    # Non-interactive install.
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Update PATH and current shell.

    # TODO: Just manually add this to bash_profile
    # echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> $HOME/.bash_profile
    
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
# Update brew.
brew update && brew upgrade && brew upgrade --cask
brew install gcc # Recommended by brew.


### bitwarden ###
do_action "Install bitwarden-cli?" "brew install bitwarden-cli"


### wifi-password ###
do_action "Install wifi-password (requires MacOS)?" "brew install wifi-password"


### docker ###
do_action "Install docker?" "brew install docker"


### colima ###
# Replacement for docker-desktop.
# https://github.com/abiosoft/colima
do_action "Install colima?" "brew install colima && colima start"


### ncdu ###
# Directory explorer.
do_action "Install ncdu?" "brew install ncdu"


### jq ###
# JSON processor for CLI.
# https://stedolan.github.io/jq/
do_action "Install jq?" "brew install jq"


### bash-completion ###
do_action "Install bash-completion?" "brew install bash-completion"


### git ###
do_action "Install git?" "brew install git"


### pyenv ###
# Config already added to .bash_profile.
# do_action "Install pyenv?" "git clone https://github.com/pyenv/pyenv.git ~/.pyenv"
do_action "Install pyenv?" "brew install pyenv"
# git clone https://github.com/pyenv/pyenv.git ~/.pyenv


### gitlab-cli ###
do_action "Install gitlab-cli (glab)?" "brew install glab"


### spotify ###
do_action "Install spotify?" "brew install spotify"


### github-cli ###
do_action "Install github-cli (gh)?" "brew install gh"


### macOS ###
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Cask packages are macOS only.

    ### google-chrome ###
    do_action "Install google-chrome?" "brew install --cask google-chrome"


    ### alt-tab ###
    # Enables tabbing similar to Windows.
    # https://alt-tab-macos.netlify.app/
    do_action "Install alt-tab?" "brew install --cask alt-tab"


    ### iterm2 ###
    do_action "Install iterm2?" "brew install --cask iterm2"

    
    ### visual-studio-code ###
    do_action "Install visual-studio-code?" "brew install --cask visual-studio-code"


    ### fig ###
    # Autocompletion with GUI.
    # https://fig.io/
    # https://formulae.brew.sh/cask/fig
    # https://github.com/withfig/fig
    do_action "Install fig?" "brew install --cask fig"


    ### bitwarden ###
    do_action "Install bitwarden?" "brew install --cask bitwarden"


    ### 1password ###
    do_action "Install 1password?" "brew install --cask 1password"
    do_action "Install 1password-cli?" "brew install --cask 1password-cli"
fi


# Restart terminal
exec "$SHELL"