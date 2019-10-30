backlight=$(</sys/class/backlight/intel_backlight/brightness)
max_backlight=$(</sys/class/backlight/intel_backlight/max_brightness)

let "perc = ($backlight*10000)/($max_backlight*100)"

echo " $perc%"
