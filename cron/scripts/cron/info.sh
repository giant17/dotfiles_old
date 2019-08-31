#!/bin/sh

# Display notify info

battery=$(cat /sys/class/power_supply/BAT0/capacity)
time=$(date '+%H:%M')
cal=$(calcurse -D ~/.config/calcurse -a | awk '/^ /' | wc -l)

notify-send " $time" " $battery\\n$cal"
