# install vim
sudo apt install --yes vim

# install Vundle package manager for vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# create symbolic link for vimrc
ln -s ~/dotfiles/vimrc ~/.vimrc

# install all plugins
vim +PluginInstall +qall

# install powerline fonts for airline
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
