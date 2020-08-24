# install chinese keyboard with ibus
sudo apt install --yes fcitx fcitx-googlepinyin fcitx-libs-dev fcitx-config-gtk

# install skins
wget https://raw.githubusercontent.com/gaunthan/fcitx-skin-collection/master/install-fcitx-skins.sh
bash install-fcitx-skins.sh
rm install-fcitx-skins.sh
cp -r ~/dotfiles/fcitx/skin/* ~/.config/fcitx/skin/
