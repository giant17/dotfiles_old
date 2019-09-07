#!/bin/sh

# Handle monitor layout
error() { notify-send " ERROR" "$1"; exit 1;}
require() {	ifinstalled rofi ;}
rprompt() { printf "$1" | rofi -dmenu -i -p "$2" ;}

allposs=$(xrandr -q | grep "connected")
screens=$(echo "$allposs" | grep " connected" | awk '{print $1}')

autoMonitor() {
	case $(echo "$screens" | wc -l) in
		"1") setMonitor "$screens" ;;
		"2") setMonitor "$(printf $screens | awk 'NR==2')" ;;
	esac
}

setMonitor() {
	xrandr --output "$1" --primary --auto --scale 1.0x1.0 $(echo "$allposs" | grep -v "$1" | awk '{print "--output", $1, "--off"}' | tr '\n' ' ')
	reload.sh
	notify-send " Monitor set" "$1" -t 1000
}

manualMonitor() {
	chosenMonitor=$(rprompt "$screens" "Select Display:")
	setMonitor "$chosenMonitor"
}
case "$1" in
   	--auto) autoMonitor ;;
   	--manual) manualMonitor ;;
  	*) echo "Option $1 not recognized"
esac
