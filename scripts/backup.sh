SOURCE="/"
USER="lukas"
DRIVE="/media/lukas/SANDISK/Backup"

rsync -aAXPv --delete --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} $SOURCE $DRIVE
