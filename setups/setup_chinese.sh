# install chinese keyboard support
sudo apt install --yes fcitx fcitx-configtool fcitx-googlepinyin fcitx-libs-dev
wget https://raw.githubusercontent.com/gaunthan/fcitx-skin-collection/master/install-fcitx-skins.sh
bash install-fcitx-skins.sh

cp -r ~/dotfiles/fcitx/skin/* ~/.config/fcitx/skin/
