sudo snap install discord
sudo snap install chromium
# install google-chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install --yes ./google-chrome-stable_current_amd64.deb
rm ./google-chrome-stable_current_amd64.deb

# install mendeley
sudo apt install --yes mendeleydesktop
# install spotify
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client

sudo apt-get install --yes qt5-style-plugins
sudo apt install --yes okular
sudo apt install --yes zathura
mkdir ~/.config/zathura
ln -s ~/dotfiles/zathura/zathurarc ~/.config/zathura/zathurarc

# install tex
sudo apt install --yes texlive-full
sudo apt install --yes texstudio
sudo apt install --yes pdf-presenter-console

# install typora - markdown reader
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo apt-get update
sudo apt-get install --yes typora

# install typora themes
git clone https://github.com/sweatran/typora-onedark-theme.git
mv typora-onedark-theme/theme/* ~/.config/Typora/themes/
rm -rf typora-onedark-theme
git clone https://github.com/elitistsnob/typora-cobalt-theme.git
mv typora-cobalt-theme/cobalt* ~/.config/Typora/themes/
rm -rf typora-cobalt-theme
git clone https://github.com/lostkeys/Typora-Lostkeys-Theme.git
mv Typora-Lostkeys-Theme/theme/* ~/.config/Typora/themes/
rm -rf Typora-Lostkeys-Theme
git clone git@github.com:pantajoe/typora-nord-theme.git
mv typora-nord-theme/src/* ~/.config/Typora/themes
rm -rf typora-nord-theme

# install visual studio code
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install --yes code

# install mailspring
sudo snap install mailspring

# install arc theme
git clone https://github.com/drakkar1969/MailSpring-Arc-Theme.git
mkdir -p ~/snap/mailspring/common/packages/Arc
mv MailSpring-Arc-Theme/* ~/snap/mailspring/common/packages/Arc/
rm -rf MailSpring-Arc-Theme

# install nord theme
git clone https://github.com/faraadi/mailspring-nord-theme.git
mkdir -p ~/snap/mailspring/common/packages/Nord
mv mailspring-nord-theme/* ~/snap/mailspring/common/packages/Nord/

# install conda
sudo apt install --yes libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
wget https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh
bash ./Anaconda3-2020.02-Linux-x86_64.sh
rm -rf Anaconda3-2020.02-Linux-x86_64.sh
source ~/.zshrc

# minetime
wget https://github.com/marcoancona/MineTime/releases/download/v1.8.1/MineTime_1.8.1_amd64.deb
sudo apt install --yes ./MineTime_1.8.1_amd64.deb

# install telegram
sudo apt install --yes telegram-desktop 

# install whatsapp client whatsdesk
sudo snap install whatsdesk

# install htop
sudo apt install --yes htop

# install s-tui
pip install --user s-tui

# install pdfshuffler
sudo apt install --yes pdfshuffler

# install rhythmbox
sudo apt install --yes rhythmbox
sudo apt install --yes libvisual-0.4-plugins

# install brackets
# sudo snap install brackets --classic

# install mathpix
sudo snap install mathpix-snipping-tool

# install sendmail
sudo apt install --yes ssmtp

# install color picker
sudo snap install pick-colour-picker

# install anki
wget "https://github.com/ankitects/anki/releases/download/2.1.26/anki-2.1.26-linux-amd64.tar.bz2"
tar xjf anki-2.1.26-linux-amd64.tar.bz2
cd anki-2.1.26-linux-amd64
sudo make install
cd ..
rm -rf anki-2.1.26-linux-amd64.tar.bz2
rm -rf anki-2.1.26-linux-amd64

# install mpv for audio
sudo apt install --yes mpv

# install bitwarden
sudo snap install bitwarden

# install vlc and streamlink
sudo apt install --yes vlc streamlink
