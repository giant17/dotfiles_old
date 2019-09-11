#!/bin/sh

# Enter a search term using rofi and surfraw

error() { notify-send " ERROR" "$1"; exit 1;}
prompt() { printf "$1" | rofi -dmenu -i -p "$2" ;}
require() {	ifinstalled surfraw rofi ;}

search=$(prompt "" "Search")
findsearch() { [ -z $search ] && error "$search variable not found or empty" ;}
findsearch
$TERMINAL -e surfraw duckduckgo $search


