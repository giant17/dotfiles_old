#!/bin/sh

# Mimeapp script for adding torrent to transmission-daemon, but will also start the daemon first if not running.

# transmission-daemon sometimes fails to take remote requests in its first moments.

pgrep -x transmission-da || (transmission-daemon && notify-send "Starting transmission daemon..." && sleep 3 && pkill -RTMIN+7 i3blocks)

transmission-remote -a "$@" && notify-send " Torrent added."
