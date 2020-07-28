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
alias top="top -o cpu"

# use htop with sudo (to show ram/cpu) and also sort for cpu usage
alias htop="htop --sort-key PERCENT_CPU"

# alias for better find
alias fd="fdfind"

# alias for uxplay --> mirror ios device to linux
alias airplay="uxplay"
alias imirror="uxplay"
alias airmirror="uxplay"

# -------------------------------------------------------------------
# Useful Scripts
# -------------------------------------------------------------------

alias run_backup="if test -d /media/lukas/Sandisk/backup; then /home/lukas/dotfiles/scripts/rsync-time-backup/rsync_tmbackup.sh / /media/lukas/Sandisk/backup/ /home/lukas/dotfiles/scripts/rsync-time-backup/exclude_patterns.txt; else echo 'Backup disk /media/lukas/Sandisk not available'; fi"
alias restore_backup="if test -d /media/lukas/Sandisk/backup; then /home/lukas/dotfiles/scripts/rsync-time-backup/recover.sh /media/lukas/Sandisk/backup/ / ; else echo 'Backup disk /media/lukas/Sandisk not available'; fi"

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
alias dropbox="cd ~/Dropbox"
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
