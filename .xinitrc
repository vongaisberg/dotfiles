#! /bin/bash

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources



xrandr --setprovideroutputsource modesetting NVIDIA-0

xrandr --auto


#Enable libinput-gestures
~/git/libinput-gestures/libinput-gestures-setup start &

# Update the background image.
/usr/bin/himawaripy --auto-offset --deadline 2 > ~/.himawaripy.log &

# Start compton compositor

compton -b -c --config ~/.config/compton.conf &

# Set background image
~/.fehbg &

exec i3
