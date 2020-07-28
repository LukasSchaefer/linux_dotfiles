sudo snap install discord
sudo snap install chromium
sudo apt install --yes mendeleydesktop
sudo apt-get install --yes qt5-style-plugins
sudo apt install --yes okular

# install tex
sudo apt install --yes texlive-full
sudo apt install --yes texstudio
sudo apt install --yes pdf-presenter-console

# install typora - markdown reader
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo apt-get update
sudo apt-get install typora

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

# install conda
apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
wget https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh
bash ./Anaconda3-2020.02-Linux-x86_64.sh
rm -rf Anaconda3-2020.02-Linux-x86_64.sh
source ~/.zshrc

# minetime
wget https://github.com/marcoancona/MineTime/releases/download/v1.8.1/MineTime_1.8.1_amd64.deb
sudo apt install --yes MineTime_1.8.1_amd64.deb

# install telegram
sudo apt install --yes telegram-desktop 

# install htop
sudo apt install --yes htop
