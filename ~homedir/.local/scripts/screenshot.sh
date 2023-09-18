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

f=$(date +'%Y%m%d_%H%m%S' | tofi --prompt-text "save sc to (basename): " -c ~/.config/tofi/input)

if [ ! -z "$f" ]; then
    f="$HOME/screenshots/$f.png"
    mv $tmp "$f"
    wl-copy <"$f"
else
    rm $tmp
fi
