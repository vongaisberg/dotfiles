entropy=$(</proc/sys/kernel/random/entropy_avail)
pool_size=$(</proc/sys/kernel/random/poolsize)

let "perc = ($entropy*10000)/($pool_size*100)"

#printf %.10f\\n "$(((entropy / pool_size  ))e-9"

echo " $perc%"
