#!/bin/sh

# Load X related files and launch Window Manager

[ -f "$HOME/.xprofile" ] && . ~/.xprofile
[ -f "$HOME/.Xresources" ] && xrdb -merge -I$HOME ~/.Xresources

#command -v "$WM" > /dev/null || echo "$WM not installed" && exit 1
# exec bspwm
dwmbar.sh &
exec dwm
