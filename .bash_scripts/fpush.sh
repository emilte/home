#!bin/bash

current_branch=`git rev-parse --abbrev-ref HEAD`

git push --force-with-lease origin $current_branch
