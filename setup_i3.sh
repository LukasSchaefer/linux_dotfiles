# install i3
sudo apt install --yes i3

# add PPA for i3 gaps
sudo add-apt-repository ppa:kgilmer/speed-ricer
sudo apt update

# install i3 gaps
sudo apt install --yes i3-gaps

# install i3 blocks
sudo apt install --yes i3blocks

# install pavucontrol for volume control
sudo apt install --yes pavucontrol

# install kbdd for keyboard layout management
sudo apt install --yes kbdd

# link i3 config and statusbar
rm -rf ~/.config/i3/*
ln -s ~/dotfiles/i3/config ~/.config/i3/config
ln -s ~/dotfiles/i3status.conf ~/.config/i3/i3status.conf

# install fancy lock screen
sudo apt install --yes i3lock-fancy

# install xclip, scrot (screenshot tool)
sudo apt install --yes xclip
sudo apt install --yes scrot
