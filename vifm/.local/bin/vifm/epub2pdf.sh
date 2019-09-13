#!/bin/sh

# Convert epub to PDF

error() { notify-send " ERROR" "$1"; exit 1;}

case $1 in
	*.epub) continue;;
	*) error "This is not a epub file.";;
esac

pdfName=$(echo "$1" | sed 's/epub/pdf/g')

convert() {
	tsp notify-send " Starting conversion" "$1"
	tsp pandoc      \
 	 -f epub   \
 	 -t latex  \
 	 -o $pdfName \
 	 --epub-chapter-level=1 \
 	 --pdf-engine=lualatex  \
 	 "$1"
	tsp notify-send " Conversion complete!" "$1"
}

convert $1


