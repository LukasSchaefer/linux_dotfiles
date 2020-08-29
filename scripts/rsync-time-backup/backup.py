#!/usr/bin/env python3
# backup using rsync-time-backup (https://github.com/laurent22/rsync-time-backup)

import argparse
import errno
import json
from pathlib import Path
import os
import subprocess
import sys

CONFIG_PATH=os.path.join(Path.home(), ".config/backup_conf.json")


def parse():
    """
    Parse system arguments
    :return: arguments
    """
    parser = argparse.ArgumentParser(description="Tool to backup with rsync time backup")
    parser.add_argument("--list", action='store_true', default=False, help="List all backup configurations")
    parser.add_argument("--name", type=str, default=None, help="Backup name")
    parser.add_argument("--add", action='store_true', default=False, help="Flag to add new backup configuration")
    parser.add_argument("--remove", action='store_true', default=False, help="Flag to remove backup configuration")
    parser.add_argument("--restore", action='store_true', default=False, help="Flag to restore instead of backup")
    args = parser.parse_args()
    return args

def get_config(path):
    """
    Extract configuration from file
    :param path: path to configuration file
    :return: configuration dictionary (name mapping to pairs of (SOURCE_DIR, TARGET_DIR, EXCLUDE_PATTERN))
    """
    if not os.path.isfile(path):
        print("No configuration file can be found!")
        query = ""
        while query != "y" and query != "Y" and query != "n" and query != "N":
            query = input("Do you want to create one now? [y/n] ")
        if query == "y" or query == "Y":
            create_config(path)
        else:
            sys.exit(0)

    with open(path, "r") as config_file:
        config_dict = json.load(config_file)
        # except:
        #     print(f"Invalid configuration file under {path}!")
        #     sys.exit(0)

    return config_dict

def create_config(path):
    """
    Create configuration file
    :param path: path to configuration file
    """
    print(f"Creating a configuration file at {path}...")
    # get inputs
    backup_script = input("Give the path to the <rsync_tmbackup.sh> script: ")
    if not os.path.isfile(backup_script):
        while not os.path.isfile(backup_script):
            backup_script = input("Invalid path! Try again: ")

    restore_script = input("Give the path to the <restore.sh> script: ")
    if not os.path.isfile(restore_script):
        while not os.path.isfile(restore_script):
            restore_script = input("Invalid path! Try again: ")

    # create dictionary for json
    config_dict = {}
    config_dict["backup_script"] = backup_script
    config_dict["restore_script"] = restore_script

    # create path to config if not existing
    if not os.path.exists(os.path.dirname(path)):
        try:
            os.makedirs(os.path.dirname(path))
        except OSError as exc: # Guard against race condition
            if exc.errno != errno.EEXIST:
                raise

    # write config file
    with open(path, "w") as config_file:
        json.dump(config_dict, config_file)

    add_backup(path)

def add_backup(path):
    """
    Add configuration to new backup
    :param path: path to configuration file
    """
    if not os.path.isfile(path):
        print("No configuration file can be found!")
        query = ""
        while query != "y" and query != "Y" and query != "n" and query != "N":
            query = input("Do you want to create one now? [y/n] ")
        if query == "y" or query == "Y":
            create_config(path)
        else:
            sys.exit(0)
    else:
        # get config so far
        config_dict = get_config(path)

        name = input("Which name should the backup configuration be saved under? ")
        if name in config_dict:
            print("This backup name is already used for another configuration!")
            while name in config_dict:
                name = input("Try again: ")
        source = input("Which directory should be backed up? ")
        if not os.path.isdir(source):
            while not os.path.isdir(source):
                source = input("Invalid path! Try again: ")
        target = input("Which directory should the data be backed up to? ")
        if not os.path.isdir(target):
            while not os.path.isdir(target):
                target = input("Invalid path! Try again: ")
        exclude = input("Should any directories be excluded? If yes, provide a path to an exclude file, otherwise answer with '/': ")

        config_dict[name] = (source, target, exclude)

        # write config file
        with open(path, "w") as config_file:
            json.dump(config_dict, config_file)

        subprocess.run(("mkdir", "-p", "--", f"{target}"))
        subprocess.run(("touch", f"{os.path.join(target, 'backup.marker')}"))

def remove_backup(path):
    """
    Remove configuration of existing backup
    :param path: path to configuration file
    """
    if not os.path.isfile(path):
        print("No configuration file can be found!")
        sys.exit(0)
    else:
        # get config so far
        config_dict = get_config(path)

        names = list(config_dict.keys())
        names.remove("backup_script")
        names.remove("restore_script")
        names_str = ', '.join(names)
        print("Existing configuration names:", names_str)

        name = input("Which configuration should be removed? ")
        if not name in config_dict:
            print(f"No backup configuration with name {name} exists")
            sys.exit(0)

        # remove entry with given name
        del config_dict[name]

        # write config file
        with open(path, "w") as config_file:
            json.dump(config_dict, config_file)

def write_backup(script_path, source, target, exclude):
    """
    Execute backup
    :param script_path: path to rsync_tmbackup script
    :param source: directory which should be backed up
    :param target: target directory to store backup at
    :param exclude: path to exclude pattern file or '/'
    """
    if not os.path.isdir(source):
        subprocess.run(("dunstify", "-u", "critical", f"Backup source {source} can not be found!"))
        sys.exit(0)
    if not os.path.isdir(target):
        subprocess.run(("dunstify", "-u", "critical", f"Backup disk {target} is not available!"))
        sys.exit(0)
    if exclude != "/" and not os.path.isfile(exclude):
        subprocess.run(("dunstify", "-u", "critical", f"Exclude pattern file {exclude} can not be found!"))
        sys.exit(0)

    # running backup
    subprocess.run(("dunstify", "-u", "normal", f"Backing up {source} to {target}."))
    if exclude == "/":
        subprocess.run(("sudo", f"{script_path}", f"{source}", f"{target}"))
    else:
        subprocess.run(("sudo", f"{script_path}", f"{source}", f"{target}", f"{exclude}"))
    subprocess.run(("dunstify", "-u", "normal", f"Finished backup {source} to {target}."))



def restore_backup(script_path, source, target):
    """
    Restore latest backup
    :param script_path: path to restore script
    :param source: directory where data should be restored to
    :param target: directory to get backup data from
    """
    if not os.path.isdir(source):
        subprocess.run(("dunstify", "-u", "critical", f"Restore target {source} can not be found!"))
        sys.exit(0)
    if not os.path.isdir(target):
        subprocess.run(("dunstify", "-u", "critical", f"Backup {target} is not available!"))
        sys.exit(0)

    # restore backup
    subprocess.run(("dunstify", "-u", "normal", f"Restoring backup from {target} to {source}."))
    subprocess.run(("sudo", f"{script_path}", f"{target}/latest/", f"{source}/"))
    subprocess.run(("dunstify", "-u", "normal", f"Finished restoration from {target} to {source}."))

def print_usage():
    print("Usage:")
    print("\tList existing backup configurations: ./backup.py --list")
    print("\tAdding a new backup config: ./backup.py --add")
    print("\tRemoving an existing backup config: ./backup.py --remove")
    print("\tBacking up: ./backup.py --name <backup_config_name>")
    print("\tRestore backup: ./backup.py --restore --name <backup_config_name>")

if __name__ == "__main__":
    config = get_config(CONFIG_PATH)
    args = parse()
    name = args.name

    # list backup configurations
    if args.list:
        for backup_name in config:
            if backup_name == "backup_script" or backup_name == "restore_script":
                continue
            print(f"'{backup_name}':")
            backup_source, backup_target, backup_exclude = config[backup_name]
            print(f"\tSource: {backup_source}")
            print(f"\tTarget: {backup_target}")
            print(f"\tExclude: {backup_exclude}")
        sys.exit(1)

    # add backup configuration
    if args.add:
        add_backup(CONFIG_PATH)
        sys.exit(1)

    # remove backup configuration
    if args.remove:
        remove_backup(CONFIG_PATH)
        sys.exit(1)

    # restore backup
    if args.restore:
        script = config["restore_script"]
        if name is None:
            print_usage()
            print("Error: No backup name given!")
            sys.exit(0)
        if not name in config:
            print_usage()
            print("Error: Unknown backup configuration!")
            sys.exit(0)
        source, target, _ = config[name]
        restore_backup(script, source, target)
        sys.exit(1)

    # backup data
    script = config["backup_script"]
    if name is None:
        print_usage()
        sys.exit(1)
    if not name in config:
        print_usage()
        print("Error: Unknown backup configuration!")
        sys.exit(0)
    source, target, exclude = config[name]
    write_backup(script, source, target, exclude)
    sys.exit(1)
