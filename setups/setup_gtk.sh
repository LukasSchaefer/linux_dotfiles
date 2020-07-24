# link gtkrc
rm ~/.gtkrc-2.0
ln -s ~/dotfiles/gtkrc-2.0 ~/.gtkrc-2.0

rm ~/.config/gtk-3.0/settings.ini
ln -s ~/dotfiles/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini

# install Papirus icon theme
wget -qO- https://git.io/papirus-icon-theme-install | DESTDIR="$HOME/.local/share/icons" sh

# install autoconf
sudo apt install --yes autoconf

# install Arch GTK theme
git clone https://github.com/horst3180/arc-theme --depth 1 ~/arc-theme && cd ~/arc-theme
./autogen.sh --prefix=/usr
sudo make install
cd
rm -rf ~/arc-theme

# install lxappearance
sudo apt install lxappearance

# start lxappearance and manually (!) set icons and theme
lxappearance
