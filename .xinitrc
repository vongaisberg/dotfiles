#! /bin/bash

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources



# xrandr --setprovideroutputsource modesetting NVIDIA-0

# xrandr --auto
.screenlayout/1080p_right.sh


# Update the background image.
/usr/bin/himawaripy --deadline 2 > ~/.himawaripy.log &

# Start compton compositor

picom --dbus -c --config ~/.config/compton.conf &

# Set background image
~/.fehbg &

# Start YSNP password agent
# ~/git/YouShallNotPassword/server -socket ~/git/YouShallNotPassword/socket &

# Map CapsLock to ESC
setxkbmap -option caps:escape
setxkbmap -option Control_R:NONUSBACKSLASH
xmodmap .Xmodmap
exec i3


eval $(gnome-keyring-daemon --start)
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
export SSH_AUTH_SOCK

nextcloud --background
