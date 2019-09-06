#!/bin/sh

# Handle monitor layout
error() { notify-send " ERROR" "$1"; exit 1;}
require() {	ifinstalled rofi ;}
rprompt() { printf "$1" | rofi -dmenu -i -p "$2" ;}

allposs=$(xrandr -q | grep "connected")
screens=$(echo "$allposs" | grep " connected" | awk '{print $1}')

reloadConfig() {
	pkill sxhkd
	sxhkd > /dev/null 2>&1 &
	pkill dunst
	dunst > /dev/null 2>&1 &
	setbg.sh
	setxkbmap it -option caps:super && killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape'
	xmodmap -e 'keycode 135 = Super_R'
	xset r rate 300 50
}

autoMonitor() {
	case $(echo "$screens" | wc -l) in
		"1") setMonitor "$screens" ;;
		"2") setMonitor "$(printf $screens | awk 'NR==2')" ;;
	esac
}

setMonitor() {
	xrandr --output "$1" --primary --auto --scale 1.0x1.0 $(echo "$allposs" | grep -v "$1" | awk '{print "--output", $1, "--off"}' | tr '\n' ' ')
	reloadConfig
	notify-send " Monitor set" "$1" -t 1000
}

manualMonitor() {
	chosenMonitor=$(rprompt "$screens" "Select Display:")
	setMonitor "$chosenMonitor"
}

while [ -n "$1" ]; do
	case "$1" in
		--auto) autoMonitor;;
		*) manualMonitor;;
	esac
done
