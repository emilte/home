#!/usr/bin/env bash

# New MR on gitlab.

# Abort if not gitlab repo.
git is-glab || (echo "nmr only works in gitlab repo" && return 1)

# Set up a trap to handle errors.
trap 'echo "Error occurred"; trap - ERR; return 1' ERR

issue_title="$*" # Capture all args.
issue_title=${issue_title:?}

# Create issue.
glab issue create \
    --title "$issue_title" \
    --description "" \
    --assignee emilte \
    --label team::datadeling,status::"in progress" \
    --yes

# Get the issue number.
issue_number=$(glab issue list --per-page 1 --output ids)

# Create a branch.
branch_name=$(branchify "$issue_number"-"$issue_title")
target_branch=$(git default)
target_branch=${target_branch:?}
glab mr create \
    --title "$issue_title" \
    --source-branch "$branch_name" \
    --target-branch "$target_branch" \
    --related-issue "$issue_number" \
    --copy-issue-labels \
    --create-source-branch \
    --remove-source-branch \
    --assignee emilte \
    --yes \

git fetch --all
git switch "$branch_name"
glab mr update --ready # I don't care for 'draft'.

# Open the MR in the browser.
mr
trap - ERR
