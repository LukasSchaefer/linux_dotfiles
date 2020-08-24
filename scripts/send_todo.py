#!/usr/bin/env python3
# send todos to things 3 (https://culturedcode.com/things/blog/2017/12/mail-to-things/)
# via email (using ssmtp)

import argparse
import errno
from pathlib import Path
import os
import subprocess
import sys

CONFIG_PATH=os.path.join(Path.home(), ".config/send_todos.conf")

def parse():
    """
    Parse system arguments
    :return: arguments
    """
    parser = argparse.ArgumentParser(description="Tool to send Things3 ToDos")
    parser.add_argument("--title", type=str, help="Title of ToDo")
    parser.add_argument("--text", type=str, help="Text body of ToDo")
    args = parser.parse_args()
    return args

def get_config(path):
    """
    Extract configuration from file
    :path: path to configuration file
    :return: email_address
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
        for line in config_file.readlines():
            if not line.startswith("address:"):
                print("Invalid configuration file!")
                sys.exit(1)
            else:
                email_address = str(line[8:]).strip()
    return email_address

def create_config(path):
    """
    Create configuration file
    :path: path to configuration file
    """
    print(f"Creating a configuration file at {path}...")
    email_address = input("To which email-address should todos be sent? ")

    if not os.path.exists(os.path.dirname(path)):
        try:
            os.makedirs(os.path.dirname(path))
        except OSError as exc: # Guard against race condition
            if exc.errno != errno.EEXIST:
                raise

    with open(path, "w") as config_file:
        config_file.write(f"address:{email_address}\n")

def send_mail(address, subject, text):
    """
    Send email with ssmpt (has to be setup)
    :param address: email address to send to
    :param subject: subject of email
    :param text: text body of email
    """
    ps = subprocess.Popen(("echo", f"Subject: {subject}\n\n{text}"), stdout=subprocess.PIPE)
    subprocess.run(("ssmtp", address), stdin=ps.stdout)
    ps.wait()
    #subprocess.run(["echo", f"Subject: {subject}\n\n{text}", "|", "ssmtp", address])

if __name__ == "__main__":
    address = get_config(CONFIG_PATH)
    args = parse()
    # send todo
    send_mail(address, args.title, args.text)
