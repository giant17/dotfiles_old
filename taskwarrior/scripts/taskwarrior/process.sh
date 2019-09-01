#!/bin/bash

# Process Inbox taskwarrior throught dmenu prompts


# TODO: Review someday script
# TODO: Weekly review script
# TODO: add quit option
# TODO: weekly find stalled projects

error() { notify-send " ERROR" "$1"; exit 1;}
require() {	ifinstalled taskwarrior ;}
dprompt() { printf "$1" | dmenu.sh -i -p "$2" ;}
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
	echo "$entry" >> "$journalFile"
	task del $todoID ;}

someday() {
	# Add task to a someday list
	newSomeday=$(dprompt "Quit\\n$descTodo" "Add new Someday todo:")
	ext $newSomeday
	task add +someday $newSomeday
	task del $todoID ;}


nonActionable() {
	nonActionableOption=$(dprompt "Quit\\nArchive\\n\\nSomeday\\nDelete" "$countTodo $descTodo")
	case $nonActionableOption in
		"Archive") archive;;
		"Someday") someday;;
		"Delete") task del $todoID;;
		"Quit") exit ;;
		"*") error "Option not available.";;
	esac ;}

singleTask() {

	[ -z "$1" ] || descTodo=$1

	listCategories=$(task _projects | awk '{sub(/\./," ")}1 {print$1}' | uniq)
	listProjects=$(task _projects | awk '{sub(/\./," ")}1 {for (i=2; i<=NF; i++) print $i}' | uniq)

	[ -z "$1" ] && nameTask=$(dprompt "	Quit\\n$descTodo" "$descTodo - Name?")
	[ -z "$2" ] && projectTask=$(dprompt "Quit\\n$listProjects" "$nameTask - Project?")

	ext $nameTask
	ext $projectTask

	nameTask="$1"
	projectTask="$2"

	priorityTask=$(dprompt "Quit\\nH\\nM\\nL" "$nameTask - Priority?")
	categoryTask=$(dprompt "Quit\\n$listCategories" "$nameTask - Category?")
	ext $priorityTask
	ext $categoryTask

	noteTask=$(dprompt "Quit\\n$nameTask" "Note?")
	ext $noteTask

	contextTask=$(dprompt "Quit\n$(task _tags | awk '/^@/')" "$nameTask - Context?")
	ext $contextTask

	task add priority:$priorityTask project:"$categoryTask.$projectTask" tag:$contextTask "$nameTask" annotate "$noteTask"
	task del $todoID ;}

project() {
	nameProject=$(dprompt "Quit\\n$descTodo" "Name of the project?")
	ext $nameProject
	addTask=$(dprompt "Quit\\n$descTodo" "$nameProject - What's the Next Action?")
	ext $addTask
	singleTask "$addTask" "$nameProject" ;}

delegate() {
	singleTask
	dueTask=$(dprompt "Quit\\n+1d" "$nameTask - Deadline?")
	ext $dueTask
	waitTask=$(dprompt "Quit\\n+1d" "$nameTask - Wait until?")
	ext $waitTask
	task $newId modify due:dueTask wait:$waitTask ;}

calendar() {
	day=$(dprompt "Quit\\n$(date '+%m/%d/%Y')" "Day of the event?")
	ext $day
	allDay=$(dprompt "Quit\\nYes\\nNo" "All day event?")
	ext $allDay
	nameCal=$(dprompt "Quit\\n$descTodo" "Description:")
	ext $nameCal
	case $allDay in
		"Yes") printf "$day [1] $nameCal" >> $HOME/.config/calcurse/apts;;
		"No") printf "$day @ $(dprompt "$(date '+%H:%M')" "Start time:") -> $day @ $(dprompt "$(date '+%H:%M')" "End time:")|$nameCal" >> $HOME/.config/calcurse/apts ;;
	esac ;}



singleTaskProcess() {
	min=$(dprompt "Quit\\nNo\\nYes" "$descTodo - Does it take less than 2 minutes?")
	ext $min
	if [[ "$min" == "Yes" ]]; then
		task del $todoID
		notify-send "DO IT " "$descTodo"; exit 1
	fi

	actionType=$(dprompt "Quit\\nDelegate\\nCalendar\\nNext" "Choose an action:")
	ext $actionType
	case $actionType in
		"Delegate") delegate ;;
		"Calendar") calendar;;
		"Next") singleTask;;
		"*") error "Option not available."
	esac
	task del $todoID ;}
actionable() {
	isProject=$(dprompt "Quit\\nNo\\nYes" "$countTodo $descTodo - Is there more than 1 action required?")
	ext $isProject
	case $isProject in
		"Yes") project;;
		"No") singleTaskProcess;;
		"*") error "Option not available.";;
	esac ;}

for todoID in $listIds; do
	countTodo=$(printf "$listIds" | wc -l)
	descTodo=$(task $todoID desc | awk '/^[a-zA-Z]/' | awk 'FNR== 2 {print}')
	isActionable=$(dprompt "Quit\\nYes\\nNo" "$countTodo $descTodo - Is it actionable?")
	ext $isActionable
	case $isActionable in
		"Yes") actionable;;
		"No") nonActionable ;;
		"*") error "Option not available.";;
	esac
done



