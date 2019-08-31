#!/bin/sh

# Set monitor Workspaces for BSPWM

case $(xrandr -q | grep " connected" | wc -l) in
	"1") bspc monitor LVDS-1 -d 1 2 3 4;;
	"2") bspc monitor HDMI-2 -d 1 2 3 4;;
	"3") bspc monitor HDMI-2 -d 1 2 && bspc monitor VGA-1 -d 3 4;;
esac


