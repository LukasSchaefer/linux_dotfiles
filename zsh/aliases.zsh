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

# -------------------------------------------------------------------
# Folders And Files
# -------------------------------------------------------------------

# Overall important folders
alias cheat="cd ~/cheatsheets"
alias cheatsheets="cd ~/cheatsheets"
alias cl="cd; clear"
alias c="clear"
alias dotfiles="cd ~/linux_dotfiles"
alias dt="cd ~/linux_dotfiles"
alias scripts="cd ~/linux_dotfiles/scripts"
alias dl="cd ~/Downloads"
alias desk="cd ~/Desktop"
alias db="cd ~/Dropbox"
alias dropbox="cd ~/Dropbox"
alias doc="cd ~/Documents"
alias wallpaper="cd ~/Pictures/Wallpapers"

# Overall important files
alias zshrc="mvim ~/linux_dotfiles/zsh/zshrc"
alias aliases="mvim ~/linux_dotfiles/zsh/aliases.zsh"
alias vimrc="vim ~/linux_dotfiles/vimrc"
