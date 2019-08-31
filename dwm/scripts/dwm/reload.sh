#!/bin/sh

# Reload DWM

setbg.sh &
sxhkd &
setxkbmap it -option caps:super && killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape' &
xmodmap -e 'keycode 135 = Super_R' &
xset r rate 300 50 &
dunst &
notify-send " Config reloaded." -t 1000
