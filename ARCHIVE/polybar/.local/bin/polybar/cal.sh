#!/bin/sh

calcurse -D ~/.config/calcurse -a | awk '/^ /' | wc -l
