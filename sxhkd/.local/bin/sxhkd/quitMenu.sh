#!/bin/sh

# Power off menu

# TODO: Add are you secure?

prompt() { printf "$1" | rofi -dmenu -i -p "$2" ;}

option=$(prompt "Quit Xorg\\nReboot\\nShutdown")

case $option in
	"Quit Xorg") prompt.sh "Quit Xorg?" "killall Xorg" ;;
	"Reboot") prompt.sh "Reboot?" "sudo -A reboot" ;;
	"Shutdown") prompt.sh "Shutdown?" "sudo -A shutdown now" ;;
esac


