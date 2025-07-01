function gub --description 'git-update-branch' -a branch

	# git-update-branch
	# Rebase branch on default, push and return to previous branch.

	# Do not want to stash here, because rebase might fail.
	# This would hide changes that we had in the original branch.
	
	function _check_branch_unsync
		if git is-behind
			echo "Your branch is behind"
			read -l -P "Continue anyway? [y/N] " confirm
			
			if not string match -iq "y" "$confirm"
				echo "Aborted."
				return 1
			end
		end
	end

	if test -n "$branch"
		# If branch is provided, switch to it, rebase, and switch back.
		git co $branch && _check_branch_unsync && git ub && git co -
	else
		_check_branch_unsync && git ub
	end
end
