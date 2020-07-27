# install Dunst notification daemon - https://dunst-project.org/
# install dependencies
sudo apt install --yes libdbus-1-dev libx11-dev libxinerama-dev libxrandr-dev libxss-dev libglib2.0-dev libpango1.0-dev libgtk-3-dev libxdg-basedir-dev libnotify-dev

# install dunst
git clone https://github.com/dunst-project/dunst.git
cd dunst
make
sudo make install

# optional dunstify
cp -vs $(pwd)/dunstify ~/.local/bin/

# install icon theme for dunst notifications
sudo add-apt-repository -u ppa:snwh/ppa
sudo apt update
sudo apt-get install faba-icon-theme
# manual installation (outdated)
# git clone git@github.com:snwh/faba-icon-theme.git
# cd faba-icon-theme
# # install dependencies
# sudo apt install --yes meson
# # build
# meson "build" --prefix=/usr
# # install
# sudo ninja -C "build" install

mkdir ~/.config/dunst
ln -s ~/dotfiles/dunst/dunstrc ~/.config/dunst/dunstrc
