#!/bin/sh

# Set as a cron job to check for new RSS entries for newsboat.
# If newsboat is open, sends it an "R" key to refresh.

internet() { ping -q -c 1 1.1.1.1 > /dev/null || exit ;}

rssupdate() {
	pgrep -x newsboat >/dev/null && /usr/bin/xdotool key --window "$(/usr/bin/xdotool search --name newsboat)" R && exit
	/usr/bin/newsboat -x reload
}

internet
rssupdate
