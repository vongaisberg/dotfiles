#!/bin/bash

myssid=$(iwgetid -r)


if [ "$myssid" = "GAIS" ] || [ "$myssid" = "eduroam" ] || [ "$myssid" = "A304_Maximilian" ] || [ "$myssid" = "karlsruhe.freifunk.net" ] || [ "$myssid" = "KIT" ] ; then
sudo	/home/max/git/dotfiles/backup/backup.sh &
sleep 1
pid=$(ps aux | grep '[b]org create' | grep -v grep | awk '{print $2}')
echo "$pid"

cpulimit -l 50 -p "$pid"
fi
