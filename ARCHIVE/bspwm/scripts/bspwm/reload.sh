#!/bin/sh

# Reload WM

sh $HOME/.config/bspwm/bspwmrc &
systemctl --user reload sxhkd &
notify-send " Config reloaded." -t 1000
