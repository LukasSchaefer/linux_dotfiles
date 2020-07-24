# install xcape (keyboard mapping)
sudo apt install --yes xcape

# link xinitrc
rm ~/.xinitrc
ln -s ~/dotfiles/xinitrc ~/.xinitrc

# link xprofile
ln -s ~/dotfiles/xprofile ~/.xprofile

# link Xresources
rm ~/.Xresources
ln -s ~/dotfiles/Xresources ~/.Xresources

# install Xresources-themes
git clone git@github.com:logico-dev/Xresources-themes.git ~/.Xresources-themes

# link Xclients
ln -s ~/dotfiles/Xclients ~/.Xclients

# load and merge new xinitrc and Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
