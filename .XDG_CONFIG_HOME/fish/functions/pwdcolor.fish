function pwdcolor -a path --description 'Print a color code based on the hash of the given path.'
    # Usage: pwdcolor [path]
    # If no path is provided, uses the current working directory.

    if test -z "$path"
        set path (pwd)
    end

    set -l hash (printf '%s' "$path" | sha1)
    # printf '%s' "$path" | sha1
    set -l out ""
    for i in 1 5 7
        set out "$out"(string sub -s $i -l 1 -- "$hash")
    end
    echo "$out"

end
