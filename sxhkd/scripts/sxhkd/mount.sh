#!/bin/sh
# Mount drives, android and USB

error() { notify-send " ERROR" "$1"; exit 1;}
require() {	ifinstalled jmtpfs ;}
getAndroid=$(jmtpfs -l 2>/dev/null | awk '/^[0-9]/ {print $1 $2}' |rev | cut -c2- | rev)
getUSB=$(lsblk -rpo "name,type,size,mountpoint" | awk '$2=="part"&&$4==""{printf "%s (%s)\n",$1,$3}')
getMountPoint() {
	mnts=$(du /mnt/* | awk '{print $2}')
	chosenPoint=$(printf "$mnts" | dmenu.sh -i -p "Which Mount point?")
	[ ! -d "$chosenPoint" ] && error "$chosenPoint not found" ;}
mountAndroid() {
	chosenAndroid=$(printf "$getAndroids" | dmenu.sh -i -p "Which Android device?")
	jmtpfs -device=$chosenAndroid /mnt/phone
	notify-send " Android mounted." "$chosenAndroid" && exit 0 ;}
mountUSB() {
	getMountPoint
	chosenUSB=$(printf "$getUSB" | dmenu.sh -i -p "Which USB?" | awk '{print $1}')
	sudo -A mount $chosenUSB $chosenPoint
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
		USB) mountUSB ;;
		Android) mountAndroid ;;
	esac
	}
checkType
