function tabtitle -a title
    # Usage: tabtitle "Your Tab Title"

    # doesnt work yet

    if test (count $argv) -eq 0
        printf "\033]1;%s\007" (fish_title)
    else
        printf "\033]1;%s\007" "$title"
    end

end
