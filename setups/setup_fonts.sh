# install San Francisco Apple fonts
git clone git@github.com:AppleDesignResources/SanFranciscoFont.git
cp SanFranciscoFont/* ~/.local/share/fonts/
rm -rf SanFranciscoFont

# install San Francisco Mono nerd font
wget https://github.com/artofrawr/powerline-fonts/raw/master/fonts/SFMono/SF%20Mono%20Regular%20Nerd%20Font%20Complete.otf

# install Nerd-Fonts
sudo apt install software-properties-common
sudo add-apt-repository ppa:fontforge/fontforge
sudo apt update
sudo apt install fontforge
sudo apt install python3-fontforge
sudo apt install python-configparser
# patch San Francisco font
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
conda deactivate
cd nerd-fonts
python3 font-patcher -c ~/.local/share/fonts/SanFranciscoDisplay-Regular.otf
mv San\ Francisco\ Display\ Regular\ Nerd\ Font\ Complete.otf ~/.local/share/fonts
# install Meslo font
./install.sh Meslo
# install Roboto font
./install.sh RobotoMono
# install Ubuntu fonto
./install.sh Ubuntu
# install DroidSans
./install.sh DroidSansMono
# install DejaVuSans
./install.sh DejaVuSansMono

# install siji font
git clone https://github.com/stark/siji && cd siji
./install.sh -d ~/.local/share/fonts

# move fonts to font directory
mv *.{otf,ttf} ~/.local/share/fonts/

# rebuild font cache
fc-cache -f -v
