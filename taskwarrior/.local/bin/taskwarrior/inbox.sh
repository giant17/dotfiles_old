#!/bin/sh

# Add item to inbox taskwarrior
error() { notify-send " ERROR" "$1"; exit 1;}
prompt() { printf "$1" | rofi -dmenu -i -p "$2" ;}


require() {
	ifinstalled task
}

addtodo() {
	TODO=$(prompt "Inbox")
	[ -z "$TODO" ] && error "Empty."
	task add tag:inbox $TODO
	notify-send " Add to inbox." "$TODO"
}
require
addtodo



