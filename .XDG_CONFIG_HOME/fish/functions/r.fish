function r --description 'Interactive repo/directory picker.'
	cd (find "$REPOS" -type d -maxdepth 1 | fzf) || exit
end