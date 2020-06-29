# install rofi
sudo apt --yes install rofi
sudo apt --yes install compton

# install all rofi themes
git clone https://github.com/davatorium/rofi-themes.git
cd rofi-themes
./install
cd ..
rm -rf rofi-themes
ln -s ~/dotfiles/custom_arc_slate.rafi  ~/.local/share/rofi/themes
