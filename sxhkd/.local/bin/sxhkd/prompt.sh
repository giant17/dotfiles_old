#!/bin/sh

# A dmenu binary prompt script.
# Gives a dmenu prompt labeled with $1 to perform command $2.

ifinstalled rofi
[ "$(printf "No\\nYes" | rofi -dmenu -i -p "$1")" = "Yes" ] && $2
