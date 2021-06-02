cargo cache -a
# delete orphans
yay -Rns $(yay -Qtdq)

#delete pacman cache
yay -Sc

#delete old journal entries
sudo journalctl --vacuum-time=4weeks
