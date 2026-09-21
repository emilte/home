function oslo2.
    set -l cwd (pwd)
    for repopath in $REPOS_OSLO2
        cd $repopath
        open (git remote-url-http)/pulls
    end
    cd $cwd # Go back to the original working directory.
end
