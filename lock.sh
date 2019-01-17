#!/bin/bash
ICON=$HOME/lock.png
TMPBG=/tmp/screen.png
scrot /tmp/screen.png
convert $TMPBG -scale 10% -scale 1000% $TMPBG
#convert $TMPBG -modulate 100,30 -blur 0x8 $TMPBG
convert $TMPBG $ICON'[250x250]' -gravity center -composite -matte $TMPBG
i3lock -u -n -i $TMPBG
