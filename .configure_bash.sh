
# Change default terminal to bash.
chsh -s /bin/bash

# Go to home directory.
cd ~

### brew ###
# Install brew.
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> $HOME/.bash_profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# Update brew.
brew update && brew upgrade && brew upgrade --cask


### bitwarden ###
brew install bitwarden


### wifi-password ###
brew install wifi-password


### fig ###
# Autocompletion with GUI.
# https://fig.io/
# https://formulae.brew.sh/cask/fig
# https://github.com/withfig/fig
brew install --cask fig


### alt-tab ###
# Enables tabbing similar to Windows.
# https://alt-tab-macos.netlify.app/
brew install alt-tab


### docker ###
brew install docker


### colima ###
# Replacement for docker-desktop.
# https://github.com/abiosoft/colima
brew install colima
colima start


### ncdu ###
# Directory explorer.
brew install ncdu


### jq ###
# JSON processor for CLI.
# https://stedolan.github.io/jq/
brew install jq


### vscode ###
brew install vscode

### bash-completion ###
brew install bash-completion


### git ###
brew install git


### pyenv ###
# Python version on-demand.
# https://ggkbase-help.berkeley.edu/how-to/install-pyenv/
git clone https://github.com/pyenv/pyenv.git ~/.pyenv



# Restart terminal
exec "$SHELL"