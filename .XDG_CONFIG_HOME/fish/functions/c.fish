
function c --description 'Interactive repo picker, opens VSCode.'
	code (find $REPOS -type d -maxdepth 1 | fzf) || exit
end