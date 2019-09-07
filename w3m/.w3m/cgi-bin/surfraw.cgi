#!/usr/bin/env bash

#requires: surfraw  fzf  xsel  gawk  coreutils  grep

clear

# select your elvi
PREFIX=$(surfraw -elvi | awk '{print $1}' | grep -v 'LOCAL\|GLOBAL'| fzf)

# exit script if no elvi is selected
if [ "$PREFIX" = "" ]; then exit; fi

# get user input
read -e -p "  $PREFIX >> Enter Your Search Keyword: " INPUT

# get completed search url and copy to clipboard
#alias surfraw='surfraw -browser=echo'
#surfraw $PREFIX $INPUT 2> >(cat) | cut -d'"' -f2- | sed 's/.$//' | xsel -b
surfraw -browser=echo $PREFIX $INPUT | xsel -b
