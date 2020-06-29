sudo apt install --yes fcitx fcitx-configtool fcitx-googlepinyin
wget https://raw.githubusercontent.com/gaunthan/fcitx-skin-collection/master/install-fcitx-skins.sh
bash install-fcitx-skins.sh
sudo apt remove fcitx-ui-classic
sudo apt install fcitx-ui-qimpanel

cp -r ~/dotfiles/fcitx/skin/* ~/.config/fcitx/skin/
