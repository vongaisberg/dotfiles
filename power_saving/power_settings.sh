#!/bin/sh

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
