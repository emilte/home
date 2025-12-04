function npr-selvio --description 'New PR on GitHub.'

    # Abort if not a github repo.
    if not git is-gh
        echo "npr-selvio only works in a github repo"
        return 1
    end

    set -l did_stash 0
    if _is_git_dirty
        read -P "Repo is dirty. Stash and continue? [Y/n] " -l stash_changes
        echo $stash_changes

        if not string match -iq n "$stash_changes"
            echo "Stashing changes..."
            git stash --include-untracked
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

    set -l linear_issue_regex 'sel-[0-9]+'
    set -l linear_issue (string match -r $linear_issue_regex "$issue_title") # Find linear issue ID.
    if test -n "$linear_issue"
        # Remove linear issue ID from issue title.
        set issue_title (string replace -r "$linear_issue_regex\s*" '' "$issue_title")
    end

    if test -n "$linear_issue"
        set branchname "$issue_title"
        set pr_body "https://linear.app/selvio/issue/$linear_issue"
    else
        set random_number (random 1000 9999)
        set branchname (branchify "$issue_title")-$random_number
    end

    # Ensure issue_title ends with a dot.
    if not string match -q '*.' "$issue_title"
        set issue_title "$issue_title."
    end

    # echo branchname: $branchname
    # echo issue_title: $issue_title
    # echo pr_body: $pr_body
    # echo linear_issue: $linear_issue
    # return 1

    git pm
    git checkout -b $branchname $target_branch || return 1

    # Update remote with empty commit. Github usually won't create empty PR.
    git commit --allow-empty --allow-empty-message -m "$issue_title" || return 1
    git push || return 1

    # Create a pull request.
    gh pr create --draft --title "$issue_title" --assignee "@me" --base "$target_branch" --body "$pr_body" || return 1

    # Ask to apply stash.
    if test $did_stash -eq 1
        read -P "Apply stash again? [y/N] " -l stash_apply
        if string match -iq y "$stash_apply"
            git stash apply
        end
    end

    # Open the PR in the browser.
    # gh pr view --web

end
