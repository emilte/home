function gub --description 'git-update-branch' -a branch

	# git-update-branch
	# Rebase branch on default, push and return to previous branch.

	# Do not want to stash here, because rebase might fail.
	# This would hide changes that we had in the original branch.

	if test -n "$branch"
		git co $branch && git ub && git co -
	else
		git ub
	end
end
