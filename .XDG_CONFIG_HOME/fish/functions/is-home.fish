function is-home --description 'Check if pwd is in home repo'
	set -l t (git remote-url)
	[ "$t" = "git@github.com:emilte/home.git" ]
end
