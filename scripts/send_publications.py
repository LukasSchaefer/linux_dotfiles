#!/usr/bin/env python3
# send publications by keywords from browsertabs in telegram
# browsertabs obtained using brotab (https://github.com/balta2ar/brotab)
# send via telegram-send (https://github.com/rahiel/telegram-send)
import subprocess

KEYWORDS=["proceeding", "arxiv", "pdf", "openreview", "scholar", "paper"]

output = subprocess.check_output(["bt", "list"])
tabs = output.decode("utf-8").strip().split("\n")
# each tab is written as "<id>\t<title>\t<url>"
tabs = [t.split("\t") for t in tabs]
# hold title and urls
tabs = [(t[1], t[2]) for t in tabs]

# find publications by keywords
publications = []
for title, url in tabs:
    for keyword in KEYWORDS:
        if keyword in url:
            publications.append((title, url))
            break

# construct message
message = ""
for title, url in publications:
    message += f"{title}: {url}\n"

# send message
subprocess.run(["telegram-send", message])
