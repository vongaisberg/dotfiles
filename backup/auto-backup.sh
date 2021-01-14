#!/bin/bash

myssid=$(iwgetid -r)


if [ "$myssid" = "GAIS" ] || [ "$myssid" = "Maximilian_m315_5GHz" ] ; then
sudo	/home/max/git/dotfiles/backup/backup.sh &
sleep 1
pid=$(ps aux | grep '[b]org create' | grep -v grep | awk '{print $2}')
echo "$pid"

cpulimit -l 40 -p "$pid"
fi
