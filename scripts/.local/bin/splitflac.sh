#!/bin/sh

# Take a cue file and split a flac one.
## Flac and Cue file needs to have the same name.
# Require: cuetools shntool flac

error() { notify-send " ERROR" "$1"; exit 1;}


case $1 in
	*.cue) continue;;
	*) error "This is not a cue file";;
esac

FLAC=$(echo $1 | sed 's/cue/flac/g')

[ -f $FLAC ] || error "There is no flac file."

cuebreakpoints $1 | shnsplit -o flac $FLAC

notify-send " Split complete" "The Flac file has been splitted"

# [ ! -d "$HOME/.trash" ] && mkdir $HOME/.trash
# mv $FLAC $HOME/.trash
# mv $1 $HOME/.trash
