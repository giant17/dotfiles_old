#!/bin/sh

# Backup files to server

data="
<sensible>
repos
documents
software
phone
media
downloads
"

internet() { ping -q -c 1 1.1.1.1 > /dev/null || exit ;}
sync() {
	for x in $data; do
		rsync -avP --delete -e ssh "$1" "$backup"
	done
}

internet
sync
