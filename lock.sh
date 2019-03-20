#!/usr/bin/env bash

# Enable compton's fade-in effect so that the lockscreen gets a nice fade-in
# effect.

convert \( \( $(echo /home/max/.cache/himawaripy/*)'[1920x1080]' \) -gravity center -background black -extent 1920x1080 -gravity center -font /usr/share/fonts/TTF/OpenSans-Regular.ttf -pointsize 30 -draw "fill white text -825,502 'Locked' " \) ~/git/dotfiles/lock-solid.png -gravity southwest -geometry +32+22 -composite /tmp/lockscreen.png


dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
    com.github.chjj.compton.opts_set string:no_fading_openclose boolean:false

# If disable unredir_if_possible is enabled in compton's config, we may need to
# disable that to avoid flickering. YMMV. To try that, uncomment the following
# two lines and the last two lines in this script.
# dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
#     com.github.chjj.compton.opts_set string:unredir_if_possible boolean:false

# Suspend dunst and lock, then resume dunst when unlocked.
pkill -u $USER -USR1 dunst

# convert -composite \( -size 1920x1080 canvas:none -fill black \) -gravity center \( -scale 1920x1080  $(echo /home/max/.cache/himawaripy/*) \) /tmp/lockscreen.png

i3lock -n -i /tmp/lockscreen.png \
    --insidecolor=373445ff --ringcolor=ffffffff --line-uses-inside \
    --keyhlcolor=d23c3dff --bshlcolor=d23c3dff --separatorcolor=00000000 \
    --insidevercolor=fecf4dff --insidewrongcolor=d23c3dff \
    --ringvercolor=ffffffff --ringwrongcolor=ffffffff --indpos="x+30:y+710" \
    --radius=15 --veriftext="" --wrongtext=""
pkill -u $USER -USR2 dunst

# Revert compton's config changes.
sleep 0.2
dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
    com.github.chjj.compton.opts_set string:no_fading_openclose boolean:true
# dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
#     com.github.chjj.compton.opts_set string:unredir_if_possible boolean:true
