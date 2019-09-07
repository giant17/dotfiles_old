#!/bin/sh
# Set as a cron job to check for new RSS entries for newsboat.
# If newsboat is open, sends it an "R" key to refresh.

ping -q -c 1 1.1.1.1 > /dev/null || exit

# /usr/bin/notify-send "📰 Updating RSS feeds..."

pgrep -x newsboat >/dev/null && /usr/bin/xdotool key --window "$(/usr/bin/xdotool search --name newsboat)" R && exit

echo 🔃 > /tmp/newsupdate
# pkill -RTMIN+6 i3blocks
/usr/bin/newsboat -x reload
rm -f /tmp/newsupdate
# pkill -RTMIN+6 i3blocks
# /usr/bin/notify-send "📰 RSS feed update complete."
