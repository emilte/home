#!/bin/bash

# git-update-branch
# Rebase branch on master, push and return to previous branch.
branch_name="$1"
branch_name=${branch_name:?}

# Do not want to stash here, because rebase might fail.
# This would hide changes that we had in the original branch.

git co "$branch_name" && git prm && git fpush && git co -
