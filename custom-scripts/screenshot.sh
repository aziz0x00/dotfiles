#!/bin/sh

# screenshotter with tofi, slurp, grim

pgrep tofi && exit

if [ $1 = "crop" ]; then
    pgrep slurp && exit

    dim=$(slurp)

    [ -z "$dim" ] && exit

    tmp=$(mktemp)

    grim -g "$dim" "$tmp"
else
    tmp=$(mktemp)
    grim "$tmp"
fi

clipboard_menu_option='/- clipboard -/'

f=$((echo $clipboard_menu_option; date +'%Y%m%d_%H%m%S') | tofi --prompt-text "save sc to (basename): " -c ~/.config/tofi/input)

case $f in
    $clipboard_menu_option)
        wl-copy <$tmp
        rm $tmp
        ;;
    ?*)
        f="$HOME/screenshots/$f.png"
        mv $tmp "$f"
        ;;
    *)
        rm $tmp
esac
