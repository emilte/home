function gco -a branch

	if test -z $branch
		set -l branch (git branch | fzf)
		set -l branch (string trim $branch)
	end
	
	git co $branch

end