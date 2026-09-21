function npr --description 'New PR on GitHub.'

    # Abort if not a github repo.
    if not git is-gh
        echo "npr-arkivverket only works in a github repo"
        return 1
    end

    set -l did_stash 0
    if _is_git_dirty
        read -P "Repo is dirty. Stash and continue? [Y/n] " -l stash_changes
        or return 130

        if test -z "$stash_changes"
            set stash_changes y
        end

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

    # Abort if no issue title.
    if test -z "$issue_title"
        echo "Issue title is required"
        return 1
    end

    # Target branch for PR.

    set -l default_branch (git default)
    if set -q X_NPR_TARGET_BRANCH
        set target_branch (printf '%s\n%s\n' $default_branch $X_NPR_TARGET_BRANCH  | string match -v '' | sort -u | fzf --layout=reverse --no-input --prompt 'Target branch: ')
    else
        set target_branch $default_branch
    end
    if test -z "$target_branch"
        echo "Target branch is required"
        return 1
    end

    set -l npr_count (npr-count)

    # set -l branchname_raw (branchify "$issue_title")
    set -l issue_title_short (string sub -l 35 -- "$issue_title")
    set -l branchname (branchify "$issue_title_short-$npr_count")

    set -l jira_ticket (string match -r 'VDS-[0-9]+$' "$issue_title")
    # If no match, search at start of string.
    if test -z "$jira_ticket"
        set jira_ticket (string match -r '^VDS-[0-9]+' "$issue_title")
    end
    if test -n "$jira_ticket"
        # If jira_ticket exists, prepend it to branchname.
        set branchname "$jira_ticket-$branchname"
    end

    # Ensure issue_title ends with a dot.
    if not string match -q '*.^' "$issue_title"
        set issue_title "$issue_title."
    end

    set -l pr_body ""
    if test -n "$jira_ticket"
        set pr_body "https://arkivverket.atlassian.net/browse/$jira_ticket"
    end

    # DEBUG:
    # echo $branchname_raw
    # echo $branchname
    # echo $issue_title
    # return 1

    git pm
    git sync $target_branch
    git checkout -b $branchname $target_branch || return 1

    # Update remote with empty commit. Github won't create PR without one.
    git commit --allow-empty --allow-empty-message -m "" || return 1
    # git commit --allow-empty --allow-empty-message -m "$issue_title" || return 1
    git push || return 1

    # Create a pull request.
    gh pr create --draft --title "$issue_title" --assignee "@me" --base "$target_branch" --body "$pr_body" || return 1

    # Ask to apply stash.
    if test $did_stash -eq 1
        read -P "Apply stash again? [Y/n] " -l stash_apply
        or return 130

        if test -z "$stash_apply"
            set stash_apply y
        end

        if not string match -iq n "$stash_apply"
            git stash apply
        end
    end

    # Open the PR in the browser.
    # gh pr view --web

end
