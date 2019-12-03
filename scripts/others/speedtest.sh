#!/bin/zsh
REDlight='\033[1;31m'
GREENlight='\033[1;32m'
CYANlight='\033[1;36m'
NC='\033[0m' # No Color

printf "${GREENlight}"
python ~/dotfiles/scripts/others/speedtest_cli.py
printf "${NC}"
