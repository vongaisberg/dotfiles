#!/bin/sh




# This needs to be run as root!

# Consider adding this to your visudo:
# username ALL=(ALL) NOPASSWD: ~/git/dotfiles/power_saving/power_settings.sh

# USAGE:

# 'power_settings.sh up' increases the power preference (higher clockspeed, higher power draw)
# 'power_settings.sh down' decreases the power preference (lower clockspeed, lower power draw)

# 'power_settings.sh 2' sets the power preference to 2. 0 is the lowest, 3 ist the highest value.


value=$(cat "/sys/devices/system/cpu/cpufreq/policy0/energy_performance_preference")

case $value in
	power)
		a=0
		;;
	balance_power)
		a=1
		;;
	balance_performance)
		a=2
		;;
	performance)
		a=3
		;;
esac



case $1 in
	up)
	echo incrementing
	a=$(( a + 1 ))
	;;
	down)
	echo decrementing
	a=$(( a - 1 ))
	;;
	0)
		a=0
		;;
	1)
		a=1
		;;
	2)
		a=2
		;;
	3)
		a=3
		;;


	*)
	echo "Unknown option"
	;;
esac



if (( a < 0 )); then
	a=0
fi
if (( a > 3 ));  then
	a=3
fi




case $a in
	0)
		b="power"
		;;
	1)
		b="balance_power"
		;;
	2)
		b="balance_performance"
		;;
	3)
		b="performance"
		;;
esac





for i in $(seq 0 3);
        do
		echo $b > "/sys/devices/system/cpu/cpufreq/policy${i}/energy_performance_preference"
        done

pkill -RTMIN+1 i3blocks
