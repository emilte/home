function da-issue--description 'Open the JIRA issue for the current branch.'

    set -l jira_ticket (string match -ri '^vds-[0-9]+' (git current)) # -r regex, -i ignore case
    set jira_ticket (string upper "$jira_ticket") # Prevent redirect in browser.

    if test -z "$jira_ticket"
        echo "No JIRA ticket found in branch name"
        return 1
    end
    open "https://arkivverket.atlassian.net/browse/$jira_ticket"
end
