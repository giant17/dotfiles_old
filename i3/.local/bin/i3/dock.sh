#!/bin/sh

autorandr --change
setbg
remaps
pgrep -x dunst >/dev/null && killall dunst && setsid dunst &


