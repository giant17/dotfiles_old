#!/bin/sh

# Dmenu prompt for quitting Xorg

prompt() { [ "$(printf "No\nYes" | dmenu.sh -i -p "$1")" = "Yes" ] && $2 ;}
prompt "Quitting Xorg?" "killall Xorg"
