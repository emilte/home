function gub --description 'git-update-branch' -a branch

	# git-update-branch
	# Rebase branch on master, push and return to previous branch.
	if test -z $branch
		echo "Branch name is required"
		return 1
	end

	# Do not want to stash here, because rebase might fail.
	# This would hide changes that we had in the original branch.

	git co $branch
	and git prm
	and git fpush 
	and git co -
end
