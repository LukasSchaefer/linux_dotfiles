# reloading of shell
alias reload="exec $SHELL -l"

# use nocorrect alias to prevent auto correct from "fixing" these
# -------------------------------------------------------------------

# -------------------------------------------------------------------
# Useful Parameters
# -------------------------------------------------------------------

# enable interactive mode for mv, rm, cp (asks before overwriting)
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# open folder with 'o'
alias o="xdg-open ."
alias open="xdg-open"

# sorts top list by cpu default
alias top="top -o %CPU"

# use htop with sudo (to show ram/cpu) and also sort for cpu usage
alias htop="htop --sort-key PERCENT_CPU"

# alias for better find
alias fd="fdfind"

# alias for uxplay --> mirror ios device to linux
alias airplay="uxplay"
alias imirror="uxplay"
alias airmirror="uxplay"

# alias to send publications
alias sendpubs="~/.scripts/send_publications.py"
alias sendpublications="~/.scripts/send_publications.py"
alias send_publications="~/.scripts/send_publications.py"

# alias to send (filtered) tabs
alias sendtabs="~/.scripts/send_tabs.py"
alias send_tabs="~/.scripts/send_tabs.py"

# track load
alias cpuload="watch -n.1 'cat /proc/cpuinfo | grep \"^[c]pu MHz\"'"
alias memload="watch -n.1 'cat /proc/meminfo | grep \"^MemTotal\|^Active:\|^Inactive:\"'"

# run command with GPU (Nvidia Prime mode (`nvidia-settings`) set to on-demand)
alias nvidia="__NV_PRIME_RENDER_OFFLOAD=1 __VK_LAYER_NV_optimus=NVIDIA_only __GLX_VENDOR_LIBRARY_NAME=nvidia __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0"

# -------------------------------------------------------------------
# Useful Scripts
# -------------------------------------------------------------------

# backup scripts
alias backup="python3 ~/.scripts/rsync-time-backup/backup.py"
alias list_backups="python3 ~/.scripts/rsync-time-backup/backup.py --list"
alias run_backup_home="python3 ~/.scripts/rsync-time-backup/backup.py --name home"
alias restore_backup_home="python3 ~/.scripts/rsync-time-backup/backup.py --restore --name home"
alias run_backup_root="python3 ~/.scripts/rsync-time-backup/backup.py --name root"
alias restore_backup_root="python3 ~/.scripts/rsync-time-backup/backup.py --restore --name root"

# -------------------------------------------------------------------
# Folders And Files
# -------------------------------------------------------------------

# Overall important folders
alias cheat="cd ~/cheatsheets"
alias cheatsheets="cd ~/cheatsheets"
alias cl="cd; clear"
alias c="clear"
alias dotfiles="cd ~/dotfiles"
alias dt="cd ~/dotfiles"
alias scripts="cd ~/dotfiles/scripts"
alias dl="cd ~/Downloads"
alias desk="cd ~/Desktop"
alias db="cd ~/Dropbox"
alias doc="cd ~/Documents"
alias wallpaper="cd ~/Pictures/Wallpapers"
alias pnp="cd ~/Documents/PnP"
alias dnd="cd ~/Documents/PnP/DnD"
alias phd="cd ~/Documents/University/PhD"

# Overall important files
alias zshrc="vim ~/dotfiles/zsh/zshrc"
alias aliases="vim ~/dotfiles/zsh/aliases.zsh"
alias vimrc="vim ~/dotfiles/vimrc"
alias i3config="vim ~/.config/i3/config"
alias polybarconfig="vim ~/.config/polybar/config"
alias rangerconf="vim ~/.config/ranger/rc.conf"
alias dunstrc="vim ~/.config/dunst/dunstrc"
alias roficonfig="vim ~/.config/rofi/config.rasi"
