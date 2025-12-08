# One time setup

install `gh` and login to GitHub.

Clone repo

# Make iterm read plist config
Open iterm settings -> General -> Settings -> Set external settings to homefolder -> Restart iTerm2
```
defaults read com.googlecode.iterm2
```

# Download Rosetta 2

This is needed to run Iterm2 python scripts.
```
softwareupdate --install-rosetta
```

# MacOS
https://macos-defaults.com/finder/_fxsortfoldersfirst.html#set-to-true
```
defaults write com.apple.finder "AppleShowAllFiles" -bool "true" && killall Finder
defaults write com.apple.finder "ShowPathbar" -bool "true" && killall Finder
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true" && killall Finder
defaults write com.apple.trackpad.scaling -float 3.0
defaults write com.apple.swipescrolldirection -bool false
defaults write -g ApplePressAndHoldEnabled -bool false # https://www.macworld.com/article/351347/how-to-activate-key-repetition-through-the-macos-terminal.html
```

Install from brew_packages.md

# 1Password
- Security -> Change open keybindings.
- Security -> Change confirm password occurrance
- Security -> Change Auto-lock timeout
- Security -> Option to reveal secrets

# AltTab
Give permissions.
Change trigger keybinding.
Customize thumbnail style.

# Fish
```
sudo nano /etc/shells # Add the path of fish to the list. Find with $(which fish).
chsh -s fish
```
I struggle to get fish to respect XDG.
Symlink .config/fish to $XDG_CONFIG_HOME/fish
```
ln -s "$XDG_CONFIG_HOME/fish" .config/fish
```

# VSCode
Login to sync and backup settings.

# Outlook
Change keybinds to Gmail.
