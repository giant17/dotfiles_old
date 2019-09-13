#!/bin/sh

# Create Flashcard throught Rofi menu

flashcards=$HOME/archive/data/flashcards/ankdown/default/default.md
ext() {
	if [[ "$1" == "Quit" ]]; then
		notify-send "Exiting" ; exit 1
	fi ;}

[ -f $flashcards ] || touch $flashcards

error() { notify-send " ERROR" "$1"; exit 1;}
prompt() { printf "$1" | rofi -dmenu -i -p "$2" ;}

question=$(prompt "Quit" "Question")
ext $question

answer=$(prompt "Quit" "Answer")
ext $question

printf "\\n$question\\n\\n%%\\n\\n$answer\\n\\n---" >> $flashcards

