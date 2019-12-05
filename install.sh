# install submodules
git submodule update --init

# install rofi
sudo pacman -Syu rofi
sudo pacman -Syu compton
sudo pacman -Syu yay

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

# link xinitrc
rm ~/.xinitrc
ln -s ./xinitrc ~/.xinitrc

# link xprofile
ln -s ~/.xprofile ~/.xprofile

# link Xresources
rm ~/.Xresources
ln -s ./Xresouces ~/.Xresources

# install Xresources-themes
git clone git@github.com:logico-dev/Xresources-themes.git ~/.Xresources-themes

# link Xclients
ln -s ./Xclients ~/.Xclients

# load and merge new xinitrc and Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# link profile
rm ~/.profile
ln -s ./profile ~/.profile

# link i3 config and statusbar
rm ~/.i3/config
ln -s ./i3/config ~/.i3/config
ln -s ./i3status.conf ~/.i3status.conf

# link gtkrc
rm ~/.gtkrc-2.0
ln -s ./gtkrc-2.0 ~/.gtkrc-2.0

# install Vundle package manager for vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# create symbolic link for vimrc
ln -s ./vimrc ~/.vimrc

# install all plugins
vim +PluginInstall +qall

# copy wallpapers
cp -r Wallpapers ~/Pictures/

# install feh
sudo pacman -Syu feh

# link to fehbg script
ln -s ./fehbg ~/.fehbg

# install dropbox
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd

# add dropbox to autostart
echo "[Desktop Entry]
Name=Dropbox
GenericName=File Synchronizer
Comment=Sync your files across computers and to the web
Exec=~/.dropbox-dist/dropboxd
Terminal=false
Type=Application
Icon=dropbox
Categories=Network;FileTransfer;
StartupNotify=false" > .config/autostart/dropbox.desktop

# install Papirus icon theme
wget -qO- https://git.io/papirus-icon-theme-install | DESTDIR="$HOME/.local/share/icons" sh

# install Arch GTK theme
git clone https://github.com/horst3180/arc-theme --depth 1 ~/arc-theme && cd ~/arc-theme
./autogen.sh --prefix=/usr --with-gnome=3.22
sudo make install
cd
rm -rf ~/arc-theme

# start lxappearance and manually (!) set icons and theme
lxappearance

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# link to zshrc
rm ~/.zshrc
ln -s ./zsh/zshrc ~/.zshrc

# link aliases
ln -s ./zsh/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh

# install fish-like autosuggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# install 256-color plugin
( cd $ZSH_CUSTOM/plugins && git clone https://github.com/chrissicool/zsh-256color )

# install powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# link to scripts
ln -s ./scripts ~/.scripts

# install fancy lock screen
yay -S i3lock-fancy
