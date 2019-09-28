#!/bin/sh

# Load X related files and launch Window Manager

[ -f "$HOME/.xprofile" ] && . ~/.xprofile
[ -f "$HOME/.Xresources" ] && xrdb -merge -I$HOME ~/.Xresources

exec $WM
