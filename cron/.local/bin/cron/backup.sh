#!/bin/sh

# Script for various backup solutions

internet() { ping -q -c 1 1.1.1.1 > /dev/null || exit ;}
back() { rsync -avP --delete $1 $2 ;}

remoteBackup() {
	internet
	for folder in $(ls $HOME); do
		if [ -d $folder ]; then
			rsync -avP --delete $folder $REMOTE
		fi
	done
}


localBackup() {
	dest="/home/.backup"
	back $HOME/Archive/data $dest
	back $HOME/Projects $dest
}

dataBackup() {
	dest=$HOME/Archive/data
	back $HOME/.wiki $dest/Wiki
	back $HOME/.task $dest/Todos
	back $HOME/.config/abook/addressbook $dest/Contacts
	back $HOME/.config/calcurse/apts $dest/Calendar
	rsync -avP --delete ~/.local/share/Anki2/Utente\ 1 $dest/Flashcards
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
