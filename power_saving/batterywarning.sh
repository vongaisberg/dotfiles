#!/bin/sh
export DISPLAY=:0
BATTERY_WARNING=15;
BATTERY_DANGER=5;
battery=$(acpi -b | grep -Eo "[0-9]+%" | grep -Eo "[0-9]+")
if [ "$battery" -lt "$BATTERY_WARNING" ]; then
	if [ "$(cat ~/scripts/boot/notified)" -eq 0 ]; then
		/home/max/git/dotfiles/power_saving/power_settings.sh 0
		zenity --warning --title="alert" --text="Please feed me!" --no-wrap --width=150 --height=100 &
	       	sleep 1 && i3-msg "[title=alert] focus"
	echo 1 > ~/scripts/boot/notified 
	fi
else
        echo 0 > ~/scripts/boot/notified
fi
if [ "$battery" -lt "$BATTERY_DANGER" ]; then
	if [ "$(cat ~/scripts/boot/notified)" -eq 1 ]; then
		/home/max/git/dotfiles/power_saving/power_settings.sh 0
		zenity --error --title="alert" --text="IM STARVING!" --no-wrap --width=150 --height=100 &
	       	sleep 1 && i3-msg "[title=alert] focus"

	echo 2 > ~/scripts/boot/notified 
	fi
fi




