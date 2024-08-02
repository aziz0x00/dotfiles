#!/bin/sh

file=$(
    find ~/screenshots/*png ~/*pdf ~/*png ~/*djvu ~/maths /home/homeathome/*pdf /home/homeathome/dox/ -type f -printf "%Ts %p\n" |
        sort -rn |
        cut -d ' ' -f2- |
        tofi --prompt-text "docs/images search: "
)

[ ! -z "$file" ] && xdg-open "$file"
