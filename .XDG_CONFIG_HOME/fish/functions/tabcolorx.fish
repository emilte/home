function tabcolorx -a hex --description 'Set the terminal tab color using a hex color code (e.g., FF5733 or 01a).'
    # Usage: tabcolorx FF5733
    # Usage: tabcolorx 01a

    if test (count $argv) -eq 0
        # No color provided, reset to default.
        printf "\033]6;1;bg;*;default\a"
        return 0
    end

    # Support 3-digit hex colors by expanding them to 6 digits.
    if string match -rq '^[0-9A-Fa-f]{3}$' -- $hex
        set hex (string join '' \
            (string sub -s 1 -l 1 -- $hex) (string sub -s 1 -l 1 -- $hex) \
            (string sub -s 2 -l 1 -- $hex) (string sub -s 2 -l 1 -- $hex) \
            (string sub -s 3 -l 1 -- $hex) (string sub -s 3 -l 1 -- $hex))
    end

    # Validate hex color format.
    if not string match -rq '^[0-9A-Fa-f]{6}$' -- $hex
        printf "tabcolorx: expected hex color in RGB or RRGGBB format\n" >&2
        return 1
    end

    # Convert hex to RGB components.
    set -l r (math "0x"(string sub -s 1 -l 2 -- $hex))
    set -l g (math "0x"(string sub -s 3 -l 2 -- $hex))
    set -l b (math "0x"(string sub -s 5 -l 2 -- $hex))

    tabcolor $r $g $b
end
