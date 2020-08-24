# link gtkrc
rm ~/.gtkrc-2.0
ln -s ~/dotfiles/gtkrc-2.0 ~/.gtkrc-2.0

rm ~/.config/gtk-3.0/settings.ini
ln -s ~/dotfiles/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini

# install Papirus icon theme
wget -qO- https://git.io/papirus-icon-theme-install | DESTDIR="$HOME/.local/share/icons" sh

# install dependencies
sudo apt install --yes autoconf automake pkg-config libgtk-3-dev gnome-themes-standard gtk2-engines-murrine

# install Arch GTK theme
sudo apt install --yes arc-theme

# install lxappearance
sudo apt install lxappearance

# start lxappearance and manually (!) set icons and theme
lxappearance
