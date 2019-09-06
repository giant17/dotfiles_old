#!/bin/sh

# Add new app to CSV

CSV=$HOME/repos/debian-installer/debian-apps.csv

error() { notify-send " ERROR" "$1"; exit 1;}
require() {
	ifinstalled dmenu.sh ;}
dprompt() { printf "$1" | dmenu.sh -i -p "$2" ;}
findCSV() { [ -f $CSV ] || error "$CSV not found." ;}
typeget() {
	case $(dprompt "Git Make\\nPython Pip\\nR Cran\\nDebian" "Which kind of app?") in
		"Git Make") TYPE="G";;
		"Python Pip") TYPE="P";;
		"R Cran") TYPE="R";;
		"Debian") TYPE="";;
		*) error "Please choose a valid type."
	esac ;}
askapp() {
	NAME=$(dprompt "" "What is the name of the app?")
	DESC=$(dprompt "" "Describe briefly the app.") ;}
saveapp() {
	echo "$TYPE,$NAME,$DESC" >> $CSV
	notify-send " App added." "$NAME" ;}

require
findCSV
typeget
askapp
saveapp
