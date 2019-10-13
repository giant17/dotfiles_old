#!/bin/sh

# Script for embeddding subtitles to a file
error() { notify-send " ERROR" "$1"; exit 1;}

srt="$(echo $1 | cut -d. -f1).srt"
[ -f "$srt" ] || error "There is no srt file."


case $1 in
	*.mkv) ffmpeg -i $1 -sub_charenc CP1252 -i $srt -map 0:v -map 0:a -c copy -map 1 -c:s:0 srt output.mkv && mv output.mkv $1;;
	*.mp4) ffmpeg -i $1 -sub_charenc CP1252 -i $srt -vcodec copy -acodec copy -scodec mov_text output.mp4 && mv output.mp4 $1;;
	*.avi) ffmpeg -i $1 -sub_charenc CP1252 -i $srt -map 0:v -map 0:a -c copy -map 1 -c:s:0 srt output.mkv && mv output.mkv $1;;
esac

# rm $2
