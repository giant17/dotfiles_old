#!/bin/sh
url=${1:-$QUTE_URL}

while getopts 'avp:' OPTION; do
  case "$OPTION" in
    a)

      FILENAME=$(youtube-dl --get-filename -o "%(title)s." $url)
	  tsp notify-send " Download started." "Downloading $FILENAME"
	  tsp youtube-dl --add-metadata -ic -f bestaudio/best -o '~/downloads/%(upload_date)s-%(title)s.%(ext)s' $url
	  tsp notify-send " Download complete." "$FILENAME Downloaded."
      ;;


    v)
      FILENAME=$(youtube-dl --get-filename -o "%(title)s." $url)
	  tsp notify-send " Download started." "Downloading $FILENAME"
	  tsp youtube-dl --add-metadata -ic -o '~/downloads/%(upload_date)s-%(title)s' $url
	  tsp notify-send " Downloading complete." "$FILENAME Downloaded."
	  ;;

    p)
      FILENAME=$(youtube-dl --get-filename -o "%(playlist)s." $url)
	  tsp notify-send " Download playlist started." "Downloading $FILENAME"
	  tsp youtube-dl --add-metadata -ic -o '~/downloads/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' $url
	  tsp notify-send " Downloading complete." "$FILENAME Downloaded."
      ;;
  esac
done

