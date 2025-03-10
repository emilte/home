# New PR on GitHub.

function npr --wraps=aliasCommand --description 'alias npr aliasCommand'

    # Abort if not a github repo.
    if not git is-gh
        echo "npr only works in a github repo"
        return 1
    end

    # Capture all args.
    set issue_title "$argv"
    if test -z "$issue_title"
        echo "Issue title is required"
        return 1
    end

    # Create issue.
    # Returns the URL of the created issue.
    # Example: https://github.com/emilte/cage-elo/issues/1
    set issue_url (gh issue create --title "$issue_title" --body "" --assignee "@me")

    # Checkout the issue branch.
    gh issue develop "$issue_url" --checkout

    # Get the issue number from the URL.
    set issue_number (echo "$issue_url" | grep -oE '[0-9]+$')

    # Update remote with empty commit. Github won't create empty PR.
    git commit --allow-empty --allow-empty-message -m ""
    git push

    # Target branch for PR.
    set target_branch (git default)
    if test -z "$target_branch"
        echo "Target branch is required"
        return 1
    end

    # Create a pull request.
    gh pr create --title "$issue_title" --assignee "@me" --body "" --base "$target_branch" --body "Closes #$issue_number"

    # Open the PR in the browser.
    gh pr view --web

end
