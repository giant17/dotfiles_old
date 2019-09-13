#!/bin/sh

# A script that generate ledger formatted money transitions
error() { notify-send " ERROR" "$1"; exit 1;}
prompt() { printf "$1" | rofi -dmenu -i -p "$2" ;}
ext() {
	if [[ "$1" == "Quit" ]]; then
		notify-send "Exiting" ; exit 1
	fi
}

ledger=~/archive/data/finance/finance.dat
[ -f $ledger ] || touch $ledger


getPrevious() {
	cat $ledger | grep -i "$1" | sed 's/:/ /g' | awk '{print $2}' | uniq)
}
assets=$(getPrevious "Assets")
expensesType=$(getPrevious "Expenses")
incomesType=$(getPrevious "Income")

getName() {
	date=$(prompt "Quit\\n$(date '+%Y/%m/%d')" "Date of transaction")
	ext $date
	name=$(prompt "Quit" "Name of transaction")
	ext $name
	printf "\\n\\n$date $name" >> $ledger
}

expense() {
	getName
	typeExpense=$(prompt "Quit\\n$expensesType" "Type of expense")
	ext $typeExpense
	amount=$(prompt "Quit" "Amount")
	ext $amount
	asset=$(prompt "Quit\\n$assets" "From")
	ext $asset
	printf "\\n\\tExpenses:$typeExpense\\t\\t€$amount\\n\\tAssets:$asset" >> $ledger
}

income() {
	getName
	typeIncome=$(prompt "Quit\\n$incomesType" "Type of income")
	ext $typeIncome
	amount=$(prompt "Quit" "Amount")
	ext $amount
	asset=$(prompt "Quit\\n$assets" "From")
	ext $asset
	printf "\\n\\tIncome:$typeIncome\\t\\t-€$amount\\n\\tAssets:$asset" >> $ledger
}

movement() {
	get_name
	from=$(prompt "Quit\\n$assets" "From")
	ext $from
	amount=$(prompt "Quit" "Amount")
	ext $amount
	to=$(prompt "Quit\\n$assets" "To")
	ext $to
	printf "\\n\\tIncome:$from\\t\\t-€$amount\\n\\tAssets:$to" >> $ledger
}

ledgerType=$(prompt "Quit\\nExpense\\nIncome\\nMovement" "Transaction")
case $ledgerType in
	"Quit") notify-send "Exiting" ; exit 1;;
	"Expense") expense;;
	"Income") income;;
	"Movement") movement;;
esac
