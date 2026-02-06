function prc --description 'Copy JSON title and URL to clipboard in formatted form'

    set json_data (gh pr view --json title,url)

    # Parse JSON and format as title + newline + url, then copy to clipboard.
    echo $json_data | jq -r '"\(.title)\n\(.url)"' | pbcopy

    # Show what was copied.
    pbpaste
end
