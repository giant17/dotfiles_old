#!/bin/sh

# Generate backup on remote machine over SSH
#	- bookmarks
#	- rss feeds

REMOTE="$SERVER:/mnt/4TB/backups/main/"

LOCALFILES="
$HOME/.config/bookmarks
$HOME/.config/newsboat
$HOME/.config/calcurse
$HOME/.config/qutebrowser
$HOME/.config/abook
$HOME/repos
$HOME/wiki
$HOME/music
$HOME/documents
$HOME/datasets
$HOME/movies
$HOME/tv_series
$HOME/.local/share/Anki2
$HOME/books
$HOME/courses
$HOME/papers
$HOME/pictures
$HOME/videos
$HOME/software
"

for x in $LOCALFILES; do
	rsync -avP --delete $x $REMOTE
done

