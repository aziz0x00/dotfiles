#!/bin/sh

xset r rate 250 &
xrdb -m .Xresources
xrdb -m .cache/wal/colors.Xresources
xwallpaper --zoom .config/bg
dunst &
picom &

#while true
#do
#    dunstify -t 6000 -r 2 '🤲 📿' "`shuf -n1 ~/.local/share/e4kar`"
#    sleep 10m
#done &


exec qtile start
