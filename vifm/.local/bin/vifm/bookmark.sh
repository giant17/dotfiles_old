#!/bin/sh

# Bookmark file or directory

name=$(realpath $1)

error() { notify-send " ERROR" "$1"; exit;}
add() { grep -Fxq $name $1 && error "Bookmark already present." || echo "$name" >> $1 ;}

[ -d $name ] && add $DIRECTORIES || add $FILES
notify-send " Bookmark created" "$name"


