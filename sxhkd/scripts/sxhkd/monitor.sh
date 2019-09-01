#!/bin/sh

# Menu for choosing monitor configuration.

error() { notify-send " ERROR" "$1"; exit 1;}
require() {	ifinstalled xrandr arandr ;}
# WM_CONFIG=$HOME/.config/bspwm/bspwmrc
findWM_CONFIG() { [ -f $WM_CONFIG ] || error "WM_CONFIG file not found." ;}
dprompt() { printf "$1" | dmenu -i -p "$2" ;}
setMonitor() {
	# Set chosen monitor as primary.
	findchosen() { [ -z ${chosen+x} ] && error "chosen variable not found." ;}
	findallposs() { [ -z ${allposs+x} ] && error "allposs variable not found." ;}
	findchosen
	findallposs
	xrandr --output "$chosen" --primary --auto --scale 1.0x1.0 $(echo "$allposs" | grep -v "$chosen" | awk '{print "--output", $1, "--off"}' | tr '\n' ' ') ;}

getMonitors() {
# Get all possible displays
allposs=$(xrandr -q | grep "connected")
screens=$(echo "$allposs" | grep " connected" | awk '{print $1}') ;}

getChoice() {
	# Get user choice
	chosen=$(dprompt "$screens" "Select Display arrangement:")
	case "$chosen" in
		*) setMonitor ;;
	esac ;}

restartConfig() {
	# Reload config
	# sh $WM_CONFIG
	setbg
	remaps
	pgrep -x dunst >/dev/null
	killall dunst
	setsid dunst ;}


require
# findWM_CONFIG
getMonitors
getChoice
restartConfig

