#!/bin/sh

# Reload settings

setbg.sh &
pkill sxhkd
sxhkd &
setxkbmap it -option caps:super && killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape' &
xmodmap -e 'keycode 135 = Super_R' &
xset r rate 300 50 &
pkill dunst
dunst &
redshift &
notify-send " Config reloaded." -t 1000
