function npr-count --description 'Returns serial number for new PRs. Increments the serial number each time it is called.'
    set -l count_file "$HOME/.npr-count"
    set -l serial_number 0
    if test -f "$count_file"
        set serial_number (cat "$count_file")
    end
    set serial_number (math "$serial_number + 1")
    set -l serial_number_padded (printf "%04d" $serial_number)
    echo "$serial_number" >"$count_file"
    echo $serial_number_padded
end
