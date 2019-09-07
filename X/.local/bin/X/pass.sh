#!/bin/sh

## Dmenu pass prompt

PASS="$(rofi -dmenu -password \
	-no-fixed-num-lines \
	-p "Password")"
echo $PASS
