#! /bin/bash

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources



xrandr --setprovideroutputsource modesetting NVIDIA-0

xrandr --auto



# Update the background image.
/usr/bin/himawaripy --deadline 2 > ~/.himawaripy.log &

# Start compton compositor

compton --dbus -c --config ~/.config/compton.conf &

# Set background image
~/.fehbg &

# Start YSNP password agent
~/git/YouShallNotPassword/server -socket ~/git/YouShallNotPassword/socket &

# Map CapsLock to ESC
setxkbmap -option caps:escape
exec i3
