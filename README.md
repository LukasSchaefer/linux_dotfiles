## Linux Dotfiles

This contains my dotfiles for MBP 13" 2015 (2560 x 1600 retina display) including config files configuring

- i3
- polybar
- rofi
- XResources
- zsh
- GTK
- vim
- ranger
- keyboard setup (with Chinese)

The i3 and X-resources setup is loosely based on [Manjaro i3](https://manjaro.org/download/community/i3/). Note that this is a community provided edition!

My zsh setup is based on [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).

Additionally this includes some small scripts based on python, zsh and bash as well as some wallpapers



### Snippet for Backlight script setup



```
# find Identifier with `xrandr --verbose | head`                                           
# set /etc/X11/xorg.conf to
# Section "Device"
#     Identifier  "0x72"
#     Driver      "intel"
#     Option      "Backlight"  "intel_backlight"
# EndSection
```
