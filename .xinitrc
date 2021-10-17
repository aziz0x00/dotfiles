#!/bin/sh

set-theme >& /dev/null &
xset r rate 250 &
xsetroot -cursor_name left_ptr
xrdb -m .Xresources
picom &

while true
do
	notify-send '🤲 📿' "`shuf -n1 ~/.local/share/e4kar`"
	sleep 10m
done &


exec qtile start
