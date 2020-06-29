# install submodules
git submodule update --init

# install rofi
sudo apt --yes install rofi
sudo apt --yes install compton

bash setup_fonts.sh
bash setup_xserver.sh

# link profile
rm ~/.profile
ln -s ~/dotfiles/profile ~/.profile

bash setup_rofi.sh
bash setup_i3.sh

# bash setup_vim.sh

# copy wallpapers
cp -r Wallpapers ~/Pictures/

# install feh
sudo apt install --yes feh

# link to fehbg script
ln -s ~/dotfiles/fehbg ~/.fehbg

# link to scripts
ln -s ~/dotfiles/scripts ~/.scripts

bash setup_gtk.sh
bash setup_zsh.sh
