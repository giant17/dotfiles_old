#!/bin/sh

# Bookmark file or directory

file=$HOME/.config/bookmarks/files
dir=$HOME/.config/bookmarks/directories

name=$(realpath $1)

error() { notify-send " ERROR" "$1"; exit;}
add() { grep -Fxq $name $1 && error "Bookmark already present." || echo "$name" >> $1 ;}

[ -d $name ] && add $dir || add $file
notify-send " Bookmark created" "Bookmark created for $name"


