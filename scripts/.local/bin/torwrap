#!/bin/sh
ifinstalled transmission-remote-cli transmission-cli || exit

! pgrep -x transmission-daemon >/dev/null && transmission-daemon && notify-send "Starting torrent daemon..." && sleep 3 && pkill -RTMIN+7

$TERMINAL -e transmission-remote-cli
