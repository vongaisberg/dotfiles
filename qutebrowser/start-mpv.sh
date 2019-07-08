#!/bin/bash
echo "test"

typeset -a coords
coords=( $(/home/max/git/dotfiles/qutebrowser/get-window-coords.sh | tr ";" "\n") )
#X Y Width Height

echo "#######MPV SIZE:$2x$3+$(( $4 + ${coords[0]} ))+$(( $5 + ${coords[1]} + 19))"
mpv --force-window=immediate -x11-name "youtube-mpv" -geometry "$2x$3+$(( $4 + ${coords[0]} ))+$(( $5 + ${coords[1]} + 19))" "$1"
#i3-msg '[class="^mpv$"] floating enable'
