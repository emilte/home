function gco -a branch

    if test -z "$branch"
        set -f branch (git branch | fzf)
        set -f branch (string trim $branch)
    end

    if test -z "$branch"
        echo "No branch selected."
        return 1
    end

    git co $branch

end
