# install submodules
git submodule update --init

bash setups/setup_fonts.sh
bash setups/setup_xserver.sh

bash setups/setup_screens.sh

# link profile
rm ~/.profile
ln -s ~/dotfiles/profile ~/.profile

bash setups/setup_rofi.sh
bash setups/setup_i3.sh
bash setups/setup_polybar.sh

bash setups/setup_zsh.sh
bash setups/setup_vim.sh
bash setups/setup_dunst.sh

# copy wallpapers
cp -r Wallpapers ~/Pictures/

# install feh
sudo apt install --yes feh

# link to fehbg script
ln -s ~/dotfiles/fehbg ~/.fehbg

# link to scripts
ln -s ~/dotfiles/scripts ~/.scripts

bash setups/setup_gtk.sh
bash setups/setup_ranger.sh
bash setups/setup_applications.sh
bash setups/setup_chinese_fcitx.sh
bash setups/setup_uxplay.sh
