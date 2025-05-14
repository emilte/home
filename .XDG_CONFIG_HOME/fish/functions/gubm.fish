function gubm --description 'git-update-branch' -a branch

	# git-update-branch (merge)
	# Merge default branch, push and return to previous branch.

	# Do not want to stash here, because merge might fail.
	# This would hide changes that we had in the original branch.

	if test -n "$branch"
		git co $branch && git ubm && git co -
	else
		git ubm
	end
end
