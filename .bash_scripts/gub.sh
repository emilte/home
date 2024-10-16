#!/bin/bash

# git-update-branch
# Rebase branch on master, push and return to previous branch.
branch_name="$1"
branch_name=${branch_name:?}

git co "$branch_name" && git prm && git fpush && git co -
