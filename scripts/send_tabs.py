#!/usr/bin/env python3
# send publications by keywords from browsertabs to email (via ssmtp)
# and/ or telegram (https://github.com/rahiel/telegram-send)
# browsertabs obtained using brotab (https://github.com/balta2ar/brotab)

import argparse
import errno
from pathlib import Path
import os
import subprocess
import sys

CONFIG_PATH=os.path.join(Path.home(), ".config/send_tabs.conf")

def parse_arguments():
    """
    Setup parser
    :return: parsed arguments
    """
    parser = argparse.ArgumentParser(description='Process some integers.')
    parser.add_argument('--keywords', nargs="+", default=[])
    parser.add_argument('--send_all', default=False, action="store_true",
                        help='Flag whether all tabs should be send')
    parser.add_argument('--telegram', default=None, action="store_true",
                        help='Flag that publications should be send to telegram')
    parser.add_argument('--mail', default=None, action="store_true",
                        help='Flag that publications should be send via mail')
    parser.add_argument('--address', default=None, type=str,
                        help='Mail address to send publications to')
    args = parser.parse_args()
    return args


def get_config(path):
    """
    Extract configuration from file
    :path: path to configuration file
    :return: use_telegram, use_mail, email_address
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
        for idx, line in enumerate(config_file.readlines()):
            if idx == 0:
                if not line.startswith("telegram:"):
                    print("Invalid configuration file!")
                    sys.exit(1)
                else:
                    use_telegram = line[9:].strip()
                    use_telegram = use_telegram == "True"

            if idx == 1:
                if not line.startswith("email:"):
                    print("Invalid configuration file!")
                    sys.exit(1)
                else:
                    use_mail = line[6:].strip()
                    use_mail = use_mail == "True"

            if idx == 2:
                if not line.startswith("address:"):
                    print("Invalid configuration file!")
                    sys.exit(1)
                else:
                    email_address = str(line[8:]).strip()
    return use_telegram, use_mail, email_address

def create_config(path):
    """
    Create configuration file
    :path: path to configuration file
    """
    print(f"Creating a configuration file at {path}...")
    use_telegram = False
    use_email = False
    query = ""
    while query != "telegram" and query != "email" and query != "both":
        query = input("Do you want to send todos via telegram, email or both? [telegram/email/both] ")
    if query == "telegram":
        use_telegram = True
    elif query == "email":
        use_email = True
    else:
        use_telegram = True       
        use_email = True

    email_address = "None"
    if use_email:
        email_address = input("To which email-address should messages be sent? ")

    if not os.path.exists(os.path.dirname(path)):
        try:
            os.makedirs(os.path.dirname(path))
        except OSError as exc: # Guard against race condition
            if exc.errno != errno.EEXIST:
                raise

    with open(path, "w") as config_file:
        config_file.write(f"telegram:{use_telegram}\n")
        config_file.write(f"email:{use_email}\n")
        config_file.write(f"address:{email_address}\n")

def get_tabs(keywords, send_all):
    """
    Call brotab to get tabs and extract with keywords
    :return: list of (title, url) pairs
    """
    output = subprocess.check_output(["bt", "list"])
    tabs = output.decode("utf-8").strip().split("\n")
    # each tab is written as "<id>\t<title>\t<url>"
    tabs = [t.split("\t") for t in tabs]
    # hold title and urls
    tabs = [(t[1], t[2]) for t in tabs]

    if send_all:
        return tabs

    # find tabs by keywords
    filtered_tabs = []
    for title, url in tabs:
        for keyword in keywords:
            if keyword in url or keyword in title:
                filtered_tabs.append((title, url))
                break
    return filtered_tabs

def send_telegram(title, url):
    """
    Send message "title: url" via telegram-send (https://github.com/rahiel/telegram-send)
    """
    message = f"{title}: {url}"
    subprocess.run(["telegram-send", message])

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
    use_telegram, use_email, address = get_config(CONFIG_PATH)
    args = parse_arguments()
    # overwrite where to send with argparse arguments if provided
    if args.telegram is not None and args.mail is not None:
        use_telegram = True
        use_email = True
        if args.address is not None:
            address = args.address
    elif args.telegram is not None:
        use_telegram = True
        use_email = False
    elif args.mail is not None:
        use_telegram = False
        use_email = True
        if args.address is not None:
            address = args.address

    tabs = get_tabs(args.keywords, args.send_all)
    # send todos
    for title, url in tabs:
        if use_telegram:
            send_telegram(title, url)
        if use_email:
            send_mail(address, title, url)
