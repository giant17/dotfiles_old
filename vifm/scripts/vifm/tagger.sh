#!/bin/sh

# Auto tagger import for beet

error() { notify-send " ERROR" "$1"; exit 1;}

ping -q -c 1 1.1.1.1 > /dev/null || error "There is not internet connection."
beet import $1

notify-send "🎵 Music imported" "$1"


