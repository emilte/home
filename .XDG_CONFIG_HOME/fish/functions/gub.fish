function gub --description 'git-update-branch' -a branch

	# git-update-branch
	# Rebase branch on master, push and return to previous branch.
	set -l branch_name $branch
	if test -z $branch_name
		echo "Branch name is required"
		return 1
	end

	# Do not want to stash here, because rebase might fail.
	# This would hide changes that we had in the original branch.

	git co $branch_name
	git prm 
	git fpush 
	git co -
end
