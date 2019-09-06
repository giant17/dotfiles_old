#!/bin/sh
# Unmount drives, android and USB

error() { notify-send " ERROR" "$1"; exit 1;}
require() {	ifinstalled jmtpfs ;}

getUSB=$(lsblk -nrpo "name,type,size,mountpoint" | awk '$2=="part"&&$4!~/\/boot|\/home$|SWAP/&&length($4)>1{printf "%s (%s)\n",$4,$3}')
getAndroids=$(jmtpfs -l 2>/dev/null | awk '/^[0-9]/ {print $1 $2}' |rev | cut -c2- | rev)
unmountAndroid() {
	chosenAndroid=$(printf "$getAndroids" | dmenu.sh -i -p "Which Android device?")
	fusermount -u /mnt/phone
	notify-send " Android unmounted." "$chosenAndroid" && exit 0 ;}
unmountUSB() {
	chosenUSB=$(printf "$getUSB" | dmenu.sh -i -p "Which USB?" | awk '{print $1}')
	sudo -A unmount $chosenUSB $chosenPoint
	notify-send " USB mounted." "$chosenUSB" && exit 0 ;}
checkType() {
	if [ -z "$getUSB" ]; then
		[ -z "$getAndroids" ] && error "No USB drive or Android device detected"
		mountAndroid
	else
		if [ -z "$getAndroids" ];then
			mountUSB
		else
			chooseType
		fi
	fi ;}
chooseType() {
	case $(printf "USB\\nAndroid" | dmenu.sh -i -p "Mount a USB drive or Android device?") in
		USB) unmountUSB ;;
		Android) unmountAndroid ;;
	esac
	}
checkType
