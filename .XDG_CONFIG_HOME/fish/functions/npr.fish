function npr --description 'New PR on GitHub.'

    # Abort if not a github repo.
    if not git is-gh
        echo "npr only works in a github repo"
        return 1
    end

    set -l did_stash 0
    if _is_git_dirty
        read -P "Repo is dirty. Stash and continue? [Y/n] " -l stash_changes
        echo $stash_changes

        if not string match -iq "n" "$stash_changes"
            echo "Stashing changes..."
            git stash
            set did_stash 1
        else
            return 1
        end
    end

    # Capture all args.
    set -l issue_title "$argv"
    if test -z "$issue_title"
        echo "Issue title is required"
        return 1
    end
    
    # Target branch for PR.
    if set -q X_NPR_TARGET_BRANCH
        set target_branch $X_NPR_TARGET_BRANCH
    else
        set target_branch (git default)
    end
    if test -z "$target_branch"
        echo "Target branch is required"
        return 1
    end

    # Ensure issue_title ends with a dot.
    if not string match -q '*.' "$issue_title"
        set issue_title "$issue_title."
    end

    # Create issue.
    # Returns the URL of the created issue.
    # Example: https://github.com/emilte/cage-elo/issues/1
    set -l issue_url (gh issue create --title "$issue_title" --body "" --assignee "@me")

    # Checkout the issue branch.
    gh issue develop "$issue_url" --checkout

    # Get the issue number from the URL.
    set -l issue_number (echo "$issue_url" | grep -oE '[0-9]+$')

    # Update remote with empty commit. Github won't create empty PR.
    git commit --allow-empty --allow-empty-message -m "$issue_title"
    git push

    # Create a pull request.
    gh pr create --draft --title "$issue_title" --assignee "@me" --body "" --base "$target_branch" --body "Closes #$issue_number"

    # Ask to apply stash.
    if test $did_stash -eq 1
        read -P "Apply stash again? [y/N] " -l stash_apply
        if string match -iq "y" "$stash_apply"
            git stash apply
        end
    end

    # Open the PR in the browser.
    gh pr view --web

end
