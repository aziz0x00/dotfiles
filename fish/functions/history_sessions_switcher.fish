# Switch history files with fzf
# cli workspacing
function history_sessions_switcher -d='Switch history files'
    set current "$fish_history"

    if not set -q fish_history
        set current fish
    else if test -z $current
        set current '/dev/null'
    end

    fd --base-directory ~/.local/share/fish --max-depth 1 --type f '.+_history' |
        sed 's/_history$//' |
        begin; echo '/dev/null'; cat; end |
        grep -vE $current |
        sed -z 's/\n$//' |
        read -z hists

    echo $hists | fzf --print-query | tr -d '\n' | read choice

    test -z "$choice" && return

    if test "$choice" = '/dev/null'
        set choice ''
    end

    set -gx fish_history "$choice"
end
