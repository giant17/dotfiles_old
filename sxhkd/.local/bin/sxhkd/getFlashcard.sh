#!/bin/sh

# Create Flashcard throught Rofi menu

flashcards=$HOME/archive/data/flashcards/ankdown/default/default.md
[ -f $flashcards ] || touch $flashcards

error() { notify-send " ERROR" "$1"; exit 1;}
prompt() { printf "$1" | rofi -dmenu -i -p "$2" ;}

question=$(prompt "" "Question")
answer=$(prompt "" "Answer")

printf "\\n$question\\n\\n%%\\n\\n$answer\\n\\n---" >> $flashcards

