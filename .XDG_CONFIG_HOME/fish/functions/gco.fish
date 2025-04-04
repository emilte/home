function gco -a branch

	if test -z "$branch"
		set -f branch (git branch | fzf)
		set -f branch (string trim $branch)
	end
	
	git co $branch

end