function is-home --description 'Check if pwd is in home repo'
	set -l url (git remote-url) # Must be set to var before test.
	[ "$url" = "git@github.com:emilte/home.git" ]
end
