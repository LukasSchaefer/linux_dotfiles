#!/usr/bin/env bash
# Usage: echo "./restore.sh <path/to/last/backup/> <path/to/restore/to/>"
while true; do
    read -p "Are you sure you want to load the latest backup from $1 to $2? This step is irreversible! [y/n]" yn
    case $yn in
        [Yy]* ) rsync -aP --delete $1 $2; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
