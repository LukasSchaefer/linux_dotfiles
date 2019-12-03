# checks whether a twitch.tv userstream is live

import argparse
from urllib.request import urlopen
from urllib.error import URLError
import json


def parse_args():
    """ parses commandline, returns args namespace object """
    desc = ('Check online status of twitch.tv user.\n'
            'Exit prints are 0: online, 1: offline, 2: not found, 3: error.')
    parser = argparse.ArgumentParser(description = desc,
             formatter_class = argparse.RawTextHelpFormatter)
    parser.add_argument('USER', nargs = 1, help = 'twitch.tv username')
    args = parser.parse_args()
    return args


def check_user(user):
    """ returns 0: online, 1: offline, 2: not found, 3: error """
    url = 'https://api.twitch.tv/kraken/streams/' + user
    try:
        info = json.loads(urlopen(url, timeout = 15).read().decode('utf-8'))
        if info['stream'] == None:
            status = 1
        else:
            status = 0
    except URLError as e:
        if e.reason == 'Not Found' or e.reason == 'Unprocessable Entity':
            status = 2
        else:
            status = 3
    return status


# main
userlist = ["Riotgames", "EULCS1", "EULCS2", "NALCS1", "NALCS2", "SummonersInnLive", "SummonersInnLive1",
            "SummonersInnLive2", "esl_summonersinn", "Sodapoppin", "handiofiblood", "Kev1ntv", "C9Sneaky",
            "TSM_Bjergsen", "Zionspartan"]

for user in userlist:
    try:
        if check_user(user) == 0:
            print("\33[32m" + user + " is ONLINE!")
        elif check_user(user) == 1:
            print("\33[31m" + user + " is offline.")
        elif check_user(user) == 2:
            print("The channel " + user + " could not be found.")
        else:
            print("An unknown error has occured.")
    except KeyboardInterrupt:
        pass
