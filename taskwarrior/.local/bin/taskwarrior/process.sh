#!/bin/bash

# Process Inbox taskwarrior throught dmenu prompts


# TODO: Review someday script
# TODO: Weekly review script
# TODO: add quit option
# TODO: weekly find stalled projects

error() { notify-send " ERROR" "$1"; exit 1;}
require() {	ifinstalled taskwarrior rofi ;}
dprompt() { printf "$1" | rofi -dmenu -i -p "$2" ;}
check() { notify-send " Added." "$1";}

ext() {
	if [[ "$1" == "Quit" ]]; then
		notify-send "Exiting" ; exit 1
	fi ;}

# Get inbox list: task inbox
# Get count: task +in status:pending count

# Get list ids: task inboxd | sed '$ d'

listIds=$(task inboxd | sed '$ d' | awk '/[0-9]/')
archive() {
	# Save the description into journal wiki of the day
	journalPath='/home/gian/documents/wiki/diary'
	journalFile="$journalPath/$(date '+%Y-%m-%d').md"
	entry=$(dprompt "Quit\\n$descTodo" "Add journal entry:")
	ext $entry
	archiveWiki=$(dprompt "\\n$(ls ~/documents/wiki/*.md)\\nQuit" "Select an document:")
	ext $archiveWiki
	echo "$entry" >> "$journalFile"
	echo "$entry" >> "$archiveWiki"
	check "$entry"
	task del $todoID ;}

someday() {
	# Add task to a someday list
	newSomeday=$(dprompt "$descTodo\\nQuit" "Add new Someday todo:")
	ext $newSomeday
	task add +someday $newSomeday
	task del $todoID ;}

book() {
	nameBook=$(dprompt "$descTodo\\nQuit" "Book name:") ext $nameBook task add +someday +book $nameBook
	task del $todoID
	check "$nameBook" ;}

nonActionable() {
	nonActionableOption=$(dprompt "Archive\\nBook\\nSomeday\\nDelete\\nQuit" "$countTodo $descTodo")
	case $nonActionableOption in
		"Archive") archive;;
		"Someday") someday;;
		"Delete") task del $todoID && notify-send " delete" "$descTodo";;
		"Book") book;;
		"Quit") exit ;;
		"*") error "Option not available.";;
	esac ;}

singleTask() {

	# [ -z "$1" ] || descTodo=$1

	listCategories=$(task _projects | awk '{sub(/\./," ")}1 {print$1}' | uniq)
	listProjects=$(task _projects | awk '{sub(/\./," ")}1 {for (i=2; i<=NF; i++) print $i}' | uniq)

	# [ -z "$1" ] && nameTask=$(dprompt "	Quit\\n$descTodo" "$descTodo - Name?")
	# [ -z "$2" ] && projectTask=$(dprompt "Quit\\n$listProjects" "$nameTask - Project?")
	nameTask=$(dprompt "$descTodo\\nQuit" "$descTodo - Name?")
	projectTask=$(dprompt "\\n$listProjects\\nQuit" "$nameTask - Project?")

	ext $projectTask
	ext $nameTask
	# nameTask="$1" projectTask="$2"

	priorityTask=$(dprompt "\\nH\\nM\\nL\\nQuit" "$nameTask - Priority?")
	categoryTask=$(dprompt "$listCategories\\nQuit" "$nameTask - Category?")
	ext $priorityTask
	ext $categoryTask

	noteTask=$(dprompt "$nameTask\\nQuit" "Note?")
	ext $noteTask

	contextTask=$(dprompt "$(task _tags | awk '/^@/')\\nQuit" "$nameTask - Context?")
	ext $contextTask

	task add priority:$priorityTask project:"$categoryTask.$projectTask" tag:$contextTask "$nameTask"
	newId=$(task ids | awk '{sub(/-/," ")}1 {print$2}')
	task $newId annotate "$noteTask"
	task del $todoID
	check "$nameTask" ;}

# project() {
# 	nameProject=$(dprompt "Quit\\n$descTodo" "Name of the project?")
# 	ext $nameProject
# 	addTask=$(dprompt "Quit\\n$descTodo" "$nameProject - What's the Next Action?")
# 	ext $addTask
# 	singleTask "$addTask" "$nameProject" ;}

delegate() {
	singleTask
	dueTask=$(dprompt "\\n+1d\\nQuit" "$nameTask - Deadline?")
	ext $dueTask
	waitTask=$(dprompt "\\n+1d\\nQuit" "$nameTask - Wait until?")
	ext $waitTask
	task $newId modify due:dueTask wait:$waitTask ;}

calendar() {
	day=$(dprompt "$(date '+%m/%d/%Y')\\nQuit" "Day of the event?")
	ext $day
	allDay=$(dprompt "Yes\\nNo\\nQuit" "All day event?")
	ext $allDay
	nameCal=$(dprompt "$descTodo\\nQuit" "Description:")
	ext $nameCal
	case $allDay in
		"Yes") printf "$day [1] $nameCal" >> $HOME/.config/calcurse/apts;;
		"No") printf "$day @ $(dprompt "$(date '+%H:%M')" "Start time:") -> $day @ $(dprompt "$(date '+%H:%M')" "End time:")|$nameCal" >> $HOME/.config/calcurse/apts ;;
	esac ;}



singleTaskProcess() {
	min=$(dprompt "No\\nYes\\nQuit" "$descTodo - Does it take less than 2 minutes?")
	ext $min
	if [[ "$min" == "Yes" ]]; then
		task del $todoID
		notify-send "DO IT " "$descTodo"; exit 1
	fi

	actionType=$(dprompt "Next\\nDelegate\\nCalendar\\nQuit" "Choose an action:")
	ext $actionType
	case $actionType in
		"Delegate") delegate ;;
		"Calendar") calendar;;
		"Next") singleTask;;
		"*") error "Option not available."
	esac
	task del $todoID ;}
# actionable() {
# 	isProject=$(dprompt "Quit\\nNo\\nYes" "$countTodo $descTodo - Is there more than 1 action required?")
# 	ext $isProject
# 	case $isProject in
# 		"Yes") project;;
# 		"No") singleTaskProcess;;
# 		"*") error "Option not available.";;
# 	esac ;}

[ -z $listIds ] && notify-send " Inbox clean" && exit 1
for todoID in $listIds; do
	[ -z $listIds ] && notify-send " Inbox clean"
	countTodo=$(printf "$listIds" | wc -l)
	descTodo=$(task $todoID desc | awk '/^[a-zA-Z]/' | awk 'FNR== 2 {print}')
	isActionable=$(dprompt "Yes\\nNo\\nQuit" "$(printf "$countTodo - $descTodo \\nIs it actionable?")")
	ext $isActionable
	case $isActionable in
		"Yes") singleTaskProcess;;
		"No") nonActionable ;;
		"*") error "Option not available.";;
	esac
done



