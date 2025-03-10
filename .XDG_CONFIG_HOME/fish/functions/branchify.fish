# branchify   -.æøå @:-,-;-.-: !"#$!"#$%&/()=?
# branchify "  -.æøå @:-,-;-.-: !"#$!"#$%&/()=?"
function branchify --description 'alias branchify <some string>'
    set cleaned_branch_name (string join ' ' $argv) # Capture all positional args and join them into a single string.

    # Remove Norwegian characters.
    # set cleaned_branch_name (echo "$cleaned_branch_name" | sed -e 's/æ/ae/g' -e 's/ø/o/g' -e 's/å/a/g')
	set cleaned_branch_name (string replace -r 'æ' 'ae' "$cleaned_branch_name")
    set cleaned_branch_name (string replace -r 'ø' 'o' "$cleaned_branch_name")
    set cleaned_branch_name (string replace -r 'å' 'a' "$cleaned_branch_name")

    # Replace all invalid chars to spaces.
    # set cleaned_branch_name (string replace -r '[^a-zA-Z0-9_]' ' ' $cleaned_branch_name)
	# set cleaned_branch_name (string replace -r '[,.;:]' ' ' $cleaned_branch_name)


    # Remove dots and commas.
    # set cleaned_branch_name (string replace -r '[.,]' '' $cleaned_branch_name)
    # set cleaned_branch_name (string replace -r '[.,]' '' $cleaned_branch_name)

    # Trim multiple spaces down to 1 space.
    # set cleaned_branch_name (echo "$cleaned_branch_name" | tr -s ' ')
	# set cleaned_branch_name (string join ' ' (string split ' ' "$cleaned_branch_name"))


    # Replace all but letters, numbers and underscores with dash.
    # set cleaned_branch_name (string replace -r '[^a-zA-Z0-9_]' '-' "$cleaned_branch_name")

    # Trim any leading or trailing underscores/dashes/whitespace.
	# set cleaned_branch_name (string trim -c '-_' $cleaned_branch_name)
    # set cleaned_branch_name (string trim --chars='-_ ' "$cleaned_branch_name")

    # Convert to lowercase.
    # set cleaned_branch_name (echo "$cleaned_branch_name" | tr '[:upper:]' '[:lower:]')
	# set cleaned_branch_name (string lower "$cleaned_branch_name")


    echo "$cleaned_branch_name"
end