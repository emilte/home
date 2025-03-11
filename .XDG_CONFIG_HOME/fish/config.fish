# Name of this filepath.
set self "~/.config/fish/config.fish"

if type -q pyenv
    eval (pyenv init - | source)
end

# nodenv
# if type -q nodenv
#     eval (nodenv init - | source)
# end


# MacOS
# https://macos-defaults.com/finder/_fxsortfoldersfirst.html#set-to-true
#  $ defaults write com.apple.finder "AppleShowAllFiles" -bool "true" && killall Finder
#  $ defaults write com.apple.finder "ShowPathbar" -bool "true" && killall Finder
#  $ defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true" && killall Finder

# source /Users/emil/.config/broot/launcher/fish/br
source "$HOME/.cargo/env"

set -x FISH_CONFIG_HOME "$XDG_CONFIG_HOME/fish"
set -x FISH_CONFIG_FILE "$FISH_CONFIG_HOME/config.fish"

if status is-interactive
    # Commands to run in interactive sessions can go here

    
    echo
    echo "=== $self ==="

    # mise
    if type -q mise
        echo "Activating mise"
        eval (mise activate fish)
    end


    # iterm2 shell integration.
    # https://iterm2.com/documentation-shell-integration.html
    # set -U fish_user_paths /usr/local/sbin $fish_user_paths
    test -e "$HOME/.iterm2_shell_integration.fish" && source "$HOME/.iterm2_shell_integration.fish"

end
