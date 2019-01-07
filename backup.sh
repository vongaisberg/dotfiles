#!/bin/bash

##
## Setzten von Umgebungsvariablen
##

## falls nicht der Standard SSH Key verwendet wird können
## Sie hier den Pfad zu Ihrem private Key angeben
 export BORG_RSH="ssh -i /home/max/.ssh/id_rsa"

## Damit das Passwort vom Repository nicht eingegeben werden muss
## kann es in der Umgepungsvariable gesetzt werden
# export BORG_PASSPHRASE="top_secret_passphrase"

##
## Setzten von Variablen
##

LOG="/var/log/borg/backup.log"
BACKUP_USER="u194911"
REPOSITORY_DIR="earth"

## Hinweis: Für die Verwendung mit einem Backup-Account muss
## 'your-storagebox.de' in 'your-backup.de' geändert werden.

REPOSITORY="ssh://${BACKUP_USER}@${BACKUP_USER}.your-storagebox.de:23/./backup/${REPOSITORY_DIR}"

DATE=`date '+%Y-%m-%d_%H:%M:%S'`
##
## Ausgabe in Logdatei schreiben
##

exec > >(tee -i ${LOG})
exec 2>&1

echo "###### Backup gestartet: $(date) ######"

##
## An dieser Stelle können verschiedene Aufgaben vor der
## Übertragung der Dateien ausgeführt werden, wie z.B.
##
## - Liste der installierten Software erstellen
## - Datenbank Dump erstellen
##

##
## Dateien ins Repository übertragen
## Gesichert werden hier beispielsweise die Ordner root, etc,
## var/www und home
## Ausserdem finden Sie hier gleich noch eine Liste Excludes,
## die in kein Backup sollten und somit per default ausgeschlossen
## werden.
##

echo "Übertrage Dateien ..."
borg create -v --stats -C lz4 -c 600 --progress   \
    $REPOSITORY::$DATE                   \
    /                                    \
    --exclude /data                      \
    --exclude /bin                       \
    --exclude /boot                      \
    --exclude /dev                       \
    --exclude /lib                       \
    --exclude /lib64                     \
    --exclude /proc                      \
    --exclude /swapfile                  \
    --exclude /tmp                       \
    --exclude /sbin                      \
    --exclude /sys                       \
    --exclude /var/run                   \
    --exclude /run                       \
    --exclude /lost+found                \
    --exclude /mnt                       \
    --exclude /var/lib/lxcfs             \
    --exclude '/home/*/.cache'           \

echo "###### Backup beendet: $(date) ######"
