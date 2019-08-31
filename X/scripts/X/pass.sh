#!/bin/sh

# Dmenu pass prompt

. "${HOME}/.cache/wal/colors.sh"
# dmenu -i -nf "#073642" -p "$1" <&- && echo

dmenu -i -nb "$color0" -nf "$color0" -sb "$color1" -sf "$color15" -p "$1" <&- && echo
