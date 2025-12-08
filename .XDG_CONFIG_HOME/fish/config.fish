# Name of this filepath.
set self "~/.config/fish/config.fish"

### Tooling ###
# if type -q pyenv
#     Try mise instead.
#     pyenv init - fish | source
# end

# nodenv
# if type -q nodenv
#     Try mise instead.
#     nodenv init - fish | source
# end

# mise
# if type -q mise
#     Supposedly not needed, brew loads mise automatically # https://mise.jdx.dev/getting-started.html
#     mise activate fish | source
# end
### End: Tooling ###

if status is-interactive
    # Commands to run in interactive sessions can go here
    echo
    echo "=== $self ==="

    # iterm2 shell integration.
    # https://iterm2.com/documentation-shell-integration.html
    # set -U fish_user_paths /usr/local/sbin $fish_user_paths
    test -e "$HOME/.iterm2_shell_integration.fish" && source "$HOME/.iterm2_shell_integration.fish"

end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
