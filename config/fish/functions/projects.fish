function projects
    set project (
        find ~/code -maxdepth 1 -mindepth 1 -type d \
        | while read -l dir
            echo (stat -f "%a %N" "$dir")
          end \
        | sort -nr \
        | cut -d' ' -f2- \
        | fzf
    )
    if test -n "$project"
        cd "$project"
    end
end
