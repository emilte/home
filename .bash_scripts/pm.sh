#!/bin/bash

# current_branch=`git rev-parse --abbrev-ref HEAD`
default_branch=`git remote show origin | awk '/HEAD branch/ {print $NF}'`

git checkout $default_branch
git fetch --all
git pull
git checkout -
