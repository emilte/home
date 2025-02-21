#!/usr/bin/env bash

# New PR on GitHub.

# Abort if not a github repo.
git is-gh || (echo "npr only works in a github repo" && return 1)

issue_title="$*" # Capture all args.
issue_title=${issue_title:?}

# Create issue.
# Returns the URL of the created issue.
# Example: https://github.com/emilte/cage-elo/issues/1
issue_url=$(gh issue create \
    --title "$issue_title" \
    --body "" \
    --assignee "@me")

gh issue develop "$issue_url" --checkout

# Get the issue number from the URL.
issue_number=$(echo "$issue_url" | grep -oE '[0-9]+$')

# Update remote with empty commit. Github won't create empty PR.
git commit --allow-empty --allow-empty-message -m ""
git push 

# Target branch for PR.
target_branch=$(git default)
target_branch=${target_branch:?}

# Create a pull request.
gh pr create \
    --title "$issue_title" \
    --assignee "@me" \
    --body "" \
    --base "$target_branch" \
    --body "Closes #$issue_number" \

# Open the PR in the browser.
gh pr view --web
