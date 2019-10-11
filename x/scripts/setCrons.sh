#!/bin/sh

[ -d $HOME/.local/share/logs ] || mkdir $HOME/.local/share/logs
addCron() { (crontab -l ; echo "$1" "export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus; export DISPLAY=:0; . $HOME/.profile; $HOME/.local/bin/cron/$2 > $HOME/.local/share/logs/$2.logs 2>&1") | sort - | uniq - | crontab - ;}

addCron "*/5 * * * *" "gitpush"
addCron "*/5 * * * *" "lowbattery"
addCron "*/10 * * * *" "sizetrash"
addCron "*/5 * * * *" "mailsync"
addCron "*/5 * * * *" "autoAddGit"
