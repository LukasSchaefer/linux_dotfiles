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
ln -s ~/dotfiles/i3blocks.conf ~/.config/i3/i3blocks.conf
ln -s ~/dotfiles/scripts ~/.config/i3/scripts

# install fancy lock screen
sudo apt install --yes i3lock-fancy

# install xclip, scrot (screenshot tool)
sudo apt install --yes xclip
sudo apt install --yes scrot

# install xbacklight
sudo apt install --yes xbacklight

echo "check script/README for xbacklight fix"
# find Identifier with `xrandr --verbose | head`
# set /etc/X11/xorg.conf to
# Section "Device"
#     Identifier  "0x72"
#     Driver      "intel"
#     Option      "Backlight"  "intel_backlight"
# EndSection

echo "check script/README for sound device fix"
# set default amixer sound device
# find ID with `cat /proc/asound/cards` or `alsamixer` and sound card option
# set corresponding ID in /etc/asound.conf to
# defaults.pcm.card 1
# defaults.ctl.card 1
