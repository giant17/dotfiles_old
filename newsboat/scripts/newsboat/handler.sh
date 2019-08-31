#!/bin/sh

# Feed this script a link and it will give some choice programs

# "mpv (loop)") setsid mpv --input-ipc-server=/tmp/mpvsoc$(date +%s) -quiet --loop "$1" >/dev/null 2>&1 & ;;
####feh) setsid feh "$1" >/dev/null 2>&1 & ;;
####	w3m) w3m "$1" >/dev/null 2>&1 ;;

URL=$1
error() { notify-send " ERROR" "$1"; exit 1;}
dprompt() { printf "$1" | dmenu -i -p "$2" ;}
require() {	ifinstalled mpv youtube-dl tsp dmenu ;}
findBROWSER() { [ -z ${BROWSER+x} ] && error "BROWSER not found." ;}
findURL() { [ -z $URL ] && error "URL not found." ;}
getcopy() {
	echo "$1" | xclip -selection clipboard
	notify-send "  URL copied." "$1" ;}

getmpv() {
	setsid mpv -quiet "$1" >/dev/null 2>&1 &
	notify-send "  URL playing..." "$1" ;}

getdownload() {
	tsp curl -LO "$1" >/dev/null 2>&1
	tsp notify-send "  URL downloaded." "$1" ;}

getyoutubedl() {
	yt.sh -v "$1" ;}

getyoutubedla() {
	yt.sh -a "$1" ;}

getbrowser() {
	setsid "$BROWSER" "$1" >/dev/null 2>&1 &
	notify-send "爵 URL opening..." "$1" ;}

getfloat() {
	setsid mpv --input-ipc-server=/tmp/mpvsoc$(date +%s) --geometry=+0-0 --autofit=30%  --title="mpvfloat" "$1" >/dev/null 2>&1 &
	notify-send "  URL float playing ..." "$1" ;}


choice() {
	case $(dprompt "Copy\\nMpv\\nDownload\\nyoutube-dl\\nyoutube-dl (audio)\\nBrowser\\nFloat" "Open link with what program?") in
		"Copy") getcopy "$URL";;
		"Mpv") getmpv "$URL";;
		"Download") getdownload "$URL";;
		"youtube-dl") getyoutubedl "$URL";;
		"youtube-dl (audio)") getyoutubedla "$URL";;
		"Browser") getbrowser "$URL";;
		"Float") getfloat "$URL";;
esac ;}


require
findBROWSER
findURL
choice
