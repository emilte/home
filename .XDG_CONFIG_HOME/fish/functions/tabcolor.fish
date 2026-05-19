function tabcolor -a r g b --description 'Set the terminal tab color using RGB values (0-255).'

    # If no arguments, reset to default
    if test (count $argv) -eq 0
        printf "\033]6;1;bg;*;default\a"
        return 0
    else
        printf "\033]6;1;bg;red;brightness;$r\a"
        printf "\033]6;1;bg;green;brightness;$g\a"
        printf "\033]6;1;bg;blue;brightness;$b\a"
    end
end
