function pwdcolor -a path --description 'Print a color code based on the hash of the given path.'
    # Usage: pwdcolor [path]
    # If no path is provided, uses the current working directory.

    if test -z "$path"
        set path (pwd)
    end

    set -l hash (printf '%s' "$path" | sha1)
    string sub -s 1 -l 6 "$hash"

end
