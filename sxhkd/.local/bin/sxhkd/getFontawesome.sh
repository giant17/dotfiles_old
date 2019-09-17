#!/bin/bash

# Get rofi menu for choosing symbols

options='-columns 6 -width 100 -lines 20 -bw 2 -yoffset -2 -location 1'

selected=$(\
  cat ~/.config/shortcuts/fontawesome | \
  rofi -dmenu -i -markup-rows ${options} -p "Select icon: ")

# exit if nothing is selected
[[ -z $selected ]] && exit

echo -ne $(echo "$selected" |\
  awk -F';' -v RS='>' '
    NR==2{sub("&#x","",$1);print "\\u" $1;exit}'
) |  xclip -selection clipboard


