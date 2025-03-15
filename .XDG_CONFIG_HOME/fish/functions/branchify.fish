# branchify '-.æøå @:-,-;-.-: !#$!#$%&/()=?'
function branchify --description 'alias branchify <some string>'
    set -l cleaned_branch_name $argv # Capture all positional args and join them into a single string.

    # Remove Norwegian characters.
	set -l cleaned_branch_name (string replace -ar 'æ' 'ae' -- $cleaned_branch_name)
    set -l cleaned_branch_name (string replace -ar 'ø' 'o' -- $cleaned_branch_name)
    set -l cleaned_branch_name (string replace -ar 'å' 'a' -- $cleaned_branch_name)

    # Replace all invalid chars to spaces.
    set -l cleaned_branch_name (string replace -ar '\W' ' ' -- $cleaned_branch_name)

    # Trim multiple spaces down to 1 space.
	set -l cleaned_branch_name (string join ' ' (string split ' ' -- $cleaned_branch_name))

    # Replace all but letters, numbers and underscores with dash.
    set -l cleaned_branch_name (string replace -ar '\W' '-' -- $cleaned_branch_name)

    # Trim any leading or trailing underscores/dashes/whitespace.
    set -l cleaned_branch_name (string trim -c '-_ ' -- "$cleaned_branch_name")

    # Convert to lowercase.
	set -l cleaned_branch_name (string lower -- $cleaned_branch_name)


    echo $cleaned_branch_name
end