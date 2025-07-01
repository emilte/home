function gubm --description 'git-update-branch' -a branch

	# git-update-branch (merge)
	# Merge default branch, push and return to previous branch.

	# Do not want to stash here, because merge might fail.
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
		git co $branch && git ubm && git co -
	else
		git ubm
	end
end
