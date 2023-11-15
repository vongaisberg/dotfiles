#!/bin/bash
export DISPLAY=:0
BATTERY_WARNING=20;
BATTERY_DANGER=10;
battery=$(acpi -b | grep -Eo "[0-9]+%" | grep -Eo "[0-9]+")
if [ "$battery" -lt "$BATTERY_WARNING" ]; then
	if [ "$(cat /tmp/notified)" -eq 0 ]; then
		zenity --warning --title="alert" --text="Battery 20%" --no-wrap --width=150 --height=100 &
	       	sleep 1 && i3-msg "[title=alert] focus"
	echo 1 > /tmp/notified 
	fi
else
	echo 0 > /tmp/notified
fi
if [ "$battery" -lt "$BATTERY_DANGER" ]; then
	if [ "$(cat /tmp/notified)" -eq 1 ]; then
		zenity --error --title="alert" --text="Battery 10%" --no-wrap --width=150 --height=100 &
	       	sleep 1 && i3-msg "[title=alert] focus"

	echo 2 > /tmp/notified 
	fi
fi


