#!/bin/sh
error() { notify-send " ERROR" "$1"; exit 1;}

url=$2

while getopts 'avp:' OPTION; do
  case "$OPTION" in
    a)

      FILENAME=$(youtube-dl --get-filename -o "%(title)s." $url)
	  tsp notify-send "🎵 Download started." "$FILENAME"
	  tsp youtube-dl --add-metadata -ic -f bestaudio/best -o '~/%(upload_date)s-%(title)s.%(ext)s' $url
	  tsp notify-send "🎵 Download complete." "$FILENAME"
      ;;


    v)
      FILENAME=$(youtube-dl --get-filename -o "%(title)s." $url)
	  tsp notify-send " Download started." "$FILENAME"
	  tsp youtube-dl --add-metadata -ic -o '~/%(upload_date)s-%(title)s' $url
	  tsp notify-send " Downloading complete." "$FILENAME"
	  ;;

    p)
      FILENAME=$(youtube-dl --get-filename -o "%(playlist)s." $url)
	  tsp notify-send " Download playlist started." "$FILENAME"
	  tsp youtube-dl --add-metadata -ic -o '~/downloads/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' $url
	  tsp notify-send " Downloading complete." "$FILENAME"
      ;;
	*)
	  error "Please choose a valid option."
  esac
done

