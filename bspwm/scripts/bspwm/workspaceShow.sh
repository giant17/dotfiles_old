#!/bin/bash

# Display active workspaces

active=$(bspc query -D -d focused --names)
occupied=$(bspc query -D -d .occupied --names)
allNum=$(bspc query -D | wc -l)

notification=""

for n in $(seq $allNum); do
	if [[ $n == $active ]]; then
		notification="$notification   "
	elif echo $occupied | grep -q $n ; then
		notification="$notification   "
	else
		notification="$notification   "
	fi
done

$notification

batteryPerc=$(cat /sys/class/power_supply/BAT0/capacity)

