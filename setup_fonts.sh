# install San Francisco Apple fonts
git clone git@github.com:AppleDesignResources/SanFranciscoFont.git
cp SanFranciscoFont/* ~/.local/share/fonts/
rm -rf SanFranciscoFont

# install Nerd-Fonts
# download DroidSansMono fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/DroidSansMono.zip
unzip DroidSansMono.zip
rm -rf DroidSansMono.zip
# download Meslo fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Meslo.zip
unzip Meslo.zip
rm -rf Meslo.zip
# download Ubuntu fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Ubuntu.zip
unzip Ubuntu.zip
rm -rf Ubuntu.zip
# move fonts to font directory
mv *.{otf,ttf} ~/.local/share/fonts/

# rebuild font cache
fc-cache -f -v

