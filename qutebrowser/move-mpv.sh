#!/bin/bash

typeset -a coords
coords=( $(/home/max/git/dotfiles/qutebrowser/get-window-coords.sh | tr ";" "\n") )
#X Y Width Height

i3-msg "[instance=\"^youtube-mpv$\"] move to position $(( $4 + ${coords[0]} )) px $(( $5 + ${coords[1]} + 19)) px, resize set $2px $3px"
