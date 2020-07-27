echo "./recover.sh <path/to/last/backup/> <path/to/restore/to>"
while true; do
    read -p "Are you sure you want to load the backup from $1 to $2? This step is irreversible! [y/n]" yn
    case $yn in
        [Yy]* ) rsync -aP $1 $2; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
