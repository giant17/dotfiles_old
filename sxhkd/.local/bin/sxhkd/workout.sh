#!/bin/sh

# Workout log to wiki
error() { notify-send " ERROR" "$1"; exit 1;}
DEST="$HOME/archive/data/workout/workout_log.csv"
findDEST() { [ -f $DEST ] || error "$DEST not found" ;}
ext() {
	if [[ "$1" == "Quit" ]]; then
		notify-send "Exiting" ; exit 1
	fi ;}

prompt() { printf "$1" | rofi -dmenu -i -p "$2" ;}
getDate() {
	# Return a rofi prompt for today and all dates in file
	today=$(date '+%Y-%m-%d')
	otherDates="$(cat $DEST | awk '/^[0-9]/ {print $1}' | uniq)"
	date=$(prompt "Quit\\n$today\\n$otherDates" "Date")
	ext $date
}

getExercise() {
	# Return a rofi prompt for type of exercise
	types=$(cat $DEST | awk '/^[0-9]/ {print $3}' | uniq)
	exercise=$(prompt "Quit\\n$types" "Exercise")
	ext $exercise
}

getRepsWeight() {
	# Return Reps and Weight
	reps=$(prompt "Quit" "Reps")
	ext $reps
	weight=$(prompt "\\nQuit" "Weight")
	ext $weight
}

saveCSV() {
	# Save all data as a CSV line
	getDate
	getExercise
	getRepsWeight

	printf "$date , $exercise , $reps , $weight\\n" >> $DEST
}

findDEST
saveCSV
