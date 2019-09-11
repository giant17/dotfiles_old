#!/bin/sh
[ -z "$1" ] && echo "Give either a pdf file or a DOI as an argument." && exit

if [ -f "$1" ]; then
	# Try to get DOI from pdfinfo or pdftotext output.
	doi=$(pdfinfo "$1" | grep -io "doi:.*") ||
	doi=$(pdftotext "$1" 2>/dev/null - | grep -io "doi:.*" -m 1) ||
	exit 1
else
	doi="$1"
fi

# Check crossref.org for the bib citation.

gdoi () {
	curl -s "http://api.crossref.org/works/$1/transform/application/x-bibtex" -w "\\n"
}

x=$(gdoi $doi)
[ "$x" != "Resource not found." ] && /usr/bin/notify-send "$x" && gdoi $doi | xclip -selection clipboard
