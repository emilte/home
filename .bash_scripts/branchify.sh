#!/usr/bin/env bash

# branchify '-.æ-ø-å..r @:-,-;-.-: !#$!#$%&/()=?'
# Output: ae-o-a--r

cleaned_branch_name="$*" # Capture all positional args.

# Remove Norwegian characters.
cleaned_branch_name=$(echo "$cleaned_branch_name" | sed -e 's/æ/ae/g' -e 's/ø/o/g' -e 's/å/a/g')
#
#

# Replace all invalid chars to spaces.
cleaned_branch_name=${cleaned_branch_name//[^a-zA-Z0-9_]/ }

# Trim multiple spaces down to 1 space.
cleaned_branch_name=$( echo "$cleaned_branch_name" | tr -s ' ')

# Replace all but letters, numbers and underscores with dash.
cleaned_branch_name=${cleaned_branch_name//[^a-zA-Z0-9_]/-}

# Trim any leading or trailing underscores/dashes/whitespace.
cleaned_branch_name=$(echo "$cleaned_branch_name" | sed 's/^[-_[:space:]]*//;s/[-_[:space:]]*$//')

# Convert to lowercase.
cleaned_branch_name=$(echo "$cleaned_branch_name" | tr '[:upper:]' '[:lower:]')

echo "$cleaned_branch_name"

