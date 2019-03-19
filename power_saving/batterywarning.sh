#!/bin/sh
export DISPLAY=:0
BATTERY_WARNING=15;
BATTERY_DANGER=5;
battery=$(acpi -b | grep -Eo "[0-9]+%" | grep -Eo "[0-9]+")
if [ "$battery" -lt "$BATTERY_WARNING" ]; then
	if [ "$(cat ~/git/dotfiles/notified)" -eq 0 ]; then
	sudo	/home/max/git/dotfiles/power_saving/power_settings.sh 0
		zenity --warning --title="Battery Notification" --text="Battery at 15%" --no-wrap --width=150 --height=100 &
	       	sleep 1 && i3-msg "[title=Battery Notification] focus"
	echo 1 > ~/git/dotfiles/notified 
	fi
else
        echo 0 > ~/git/dotfiles/notified
fi
if [ "$battery" -lt "$BATTERY_DANGER" ]; then
	if [ "$(cat ~/scripts/boot/notified)" -eq 1 ]; then
	sudo	/home/max/git/dotfiles/power_saving/power_settings.sh 0
		zenity --error --title="Battery Notification" --text="Battery at 5%" --no-wrap --width=150 --height=100 &
	       	sleep 1 && i3-msg "[title=Battery Notification] focus"

	echo 2 > ~/git/dotfiles/notified 
	fi
fi




