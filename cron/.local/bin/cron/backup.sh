#!/bin/sh

# Script for various backup solutions

internet() { ping -q -c 1 1.1.1.1 > /dev/null || exit ;}
back() { rsync -avP --delete $1 $2 ;}

dockBackup() {
	back $HOME/archive /mnt/dock/backup
	back $HOME/repos /mnt/dock/backup
}




remoteBackup() {
	internet
	for folder in $(ls $HOME); do
		if [ -d $folder ]; then
			rsync -avP --delete $folder $REMOTE
		fi
	done
}

dockBackup() {
	[ -z $(isDock=$(lsblk | grep 'dock')) ] && exit

}



case "$1" in
	"--remote") remoteBackup;;
	"--dock") dockBackup;;
	"--local") localBackup;;
	"--data") dataBackup;;
esac


sync() {
	for x in $data; do
		rsync -avP --delete -e ssh "$1" "$backup"
	done
}

internet
sync
