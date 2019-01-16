#!/bin/bash

myssid=$(iwgetid -r)


if [ "$myssid" = "SGAIS" ] || [ "$myssid" = "karlsruhe.freifunk.net" ] ; then
	~/git/dotfiles/backup/backup.sh
fi
