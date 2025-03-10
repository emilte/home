# Name of this filepath.
set self "~/.config/fish/config.fish"

# Sets environment vars, e.g. HOMEBREW_PREFIX.
eval (/opt/homebrew/bin/brew shellenv)

# Recommended by brew.
set -x LDFLAGS "-L/usr/local/opt/zlib/lib"
set -x CPPFLAGS "-I/usr/local/opt/zlib/include"
set -x PKG_CONFIG_PATH "/usr/local/opt/zlib/lib/pkgconfig"
# set -x HOMEBREW_CACHE "$HOME/Projects/Caches/Homebrew" # Moved from "$HOME/Library/Caches/Homebrew".

set -x PROJECTS_HOME "$HOME/Projects" # Excluded by BDLDaemon (BitDefender) and Microsoft Defender.
set -x REPOS "$PROJECTS_HOME/repos"
set -x APPLICATION_SUPPORT "$HOME/Library/Application\ Support"
set -x XDG_DATA_HOME "$HOME/.XDG_DATA_HOME" # https://stackoverflow.com/a/71733442/12616507 # https://pnpm.io/npmrc#store-dir
set -x XDG_STATE_HOME "$HOME/.XDG_STATE_HOME" # https://pnpm.io/npmrc#state-dir
set -x XDG_CACHE_HOME "$HOME/.XDG_CACHE_HOME" # https://github.com/abiosoft/colima/pull/736
set -x XDG_CONFIG_HOME "$HOME/.XDG_CONFIG_HOME" # https://github.com/abiosoft/colima/pull/736

set -x CYPRESS_CACHE_FOLDER "$XDG_CACHE_HOME/Cypress" # Moved from "~/Library/Caches/Cypress" https://docs.cypress.io/guides/references/advanced-installation#Binary-cache
set -x RUSTUP_HOME "$PROJECTS_HOME/.rustup" # Moved from "~/.rustup" https://rust-lang.github.io/rustup/environment-variables.html

# Dart
set -x PUB_CACHE "$XDG_CACHE_HOME/.pub-cache" # Default: "~/.pub-cache" https://dart.dev/tools/pub/environment-variables

# pipenv
set -x PIPENV_VENV_IN_PROJECT 1
set -x LANG "en_GB.UTF-8"
set -x PIPENV_CACHE_DIR "$XDG_CACHE_HOME/pipenv" # Moved from "~/Library/Caches/pipenv" https://github.com/pypa/pipenv/blob/main/docs/configuration.md#changing-cache-location

# lima/colima
set -x LIMA_HOME "$XDG_CONFIG_HOME/.lima" # Moved from "~/.lima" https://lima-vm.io/docs/dev/internals/#lima-home-directory-lima_home

# pyenv
set -x PYENV_ROOT "$PROJECTS_HOME/.pyenv"
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
