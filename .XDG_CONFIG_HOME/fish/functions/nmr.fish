#!/usr/bin/env fish


function nmr --description 'New MR on gitlab.'
    # Abort if not gitlab repo.
    if not git is-glab
        echo "nmr only works in gitlab repo"
        return 1
    end

    # Capture all args as issue title.
    set -l issue_title $argv
    if test -z "$issue_title"
        echo "Issue title is required"
        return 1
    end

    # Create issue.
    glab issue create \
        --title "$issue_title" \
        --description "" \
        --assignee emilte \
        --yes

    # Get the issue number.
    set -l issue_number (glab issue list --per-page 1 --output-format ids)

    # Create a branch.
    set -l branch_name (branchify "$issue_number-$issue_title")
    set -l target_branch (git default)
    if test -z "$target_branch"
        echo "Target branch is required"
        return 1
    end

    glab mr create \
        --title "$issue_title" \
        --source-branch "$branch_name" \
        --target-branch "$target_branch" \
        --related-issue "$issue_number" \
        --copy-issue-labels \
        --create-source-branch \
        --remove-source-branch \
        --assignee emilte \
        --yes

    git fetch --all
    git switch "$branch_name"
    glab mr update --ready # I don't care for 'draft'.

    # Open the MR in the browser.
    mr
end
