function c --description 'Interactive repo picker, opens VSCode.' -a dir
    if test -z "$dir"
        set -f dir (find $REPOS -type d -maxdepth 1 | fzf )
        test -z "$dir" && return 1 # Error if still not selected.
    end
    code $dir
end
