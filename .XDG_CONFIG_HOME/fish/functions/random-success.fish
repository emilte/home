
function random-success -d "Successful 1 in n times" -a n
	if test -z "$n"
		echo "Missing arg <n>"
		return 1
	end

	# Generate a random number between 1 and n.
    test (random 1 $n) -eq 1
end