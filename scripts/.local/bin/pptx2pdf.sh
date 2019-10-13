#!/bin/sh

# Script ttaht convert pttx (power point) files to pdf
# TODO: Add possibility ppt

error() { notify-send " ERROR" "$1"; exit 1 ;}

fullfilename="$(realpath $1)"
filename=$(basename "$fullfilename")
ext="${filename##*.}"

case $1 in
	*pptx|*.ppt) ifinstalled "unoconv" && unoconv -f pdf $1;;
	*) error "Selected file is not pptx."
esac

notify-send " Conversion Complete" "PDF file generated."




