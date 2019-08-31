#!/bin/sh

# Add item to inbox taskwarrior
error() { notify-send " ERROR" "$1"; exit 1;}

require() {
	ifinstalled task
	ifinstalled dmenu
	ifinstalled notify-send
}

addtodo() {
	TODO=$(echo "" | dmenu.sh -p "Add to inbox: ")
	[ -z "$TODO" ] && error "Empty."
	task add tag:inbox $TODO
	notify-send " Add to inbox." "$TODO"
}
require
addtodo



