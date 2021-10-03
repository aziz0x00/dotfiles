#!/bin/bash

draw() {
  ~/.config/lf/draw_img.sh "${1:-$file_cache}" $w $h $x $y
  exit 1
}

file="$1"
file_cache=$HOME/.cache/ranger/`readlink -f "$file"\
  | sha1sum | cut -f1 -d\ `.jpg

x=$4
y=$5
w=$2
h=$3
pv_image_enabled=`[ $w -eq 0 ] && echo -n False || {
	echo -n True
	[ -f $file_cache ] && draw
}`

~/.config/ranger/scope.sh "$file" $w $h $file_cache $pv_image_enabled
ret=$?

[ $ret -eq 6 ] && draw
[ $ret -eq 7 ] && draw "$file"
