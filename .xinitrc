#!/bin/sh

set-theme >& /dev/null &
xset r rate 250 &
picom &

while true
do
	notify-send "`shuf -n1 ~/.local/share/e4kar`"
	sleep 10m
done &


exec openbox
