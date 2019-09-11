#!/bin/bash

# Download url as PDF

printf "%s" "$1" | xsel -b

wkhtmltopdf "$1" "$(echo "$1" | sed -e 's/https\?:\/\///' -e 's/\//-/g' ).pdf"

