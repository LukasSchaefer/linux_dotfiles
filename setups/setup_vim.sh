# install vim
sudo apt install --yes vim

# install Vundle package manager for vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# create symbolic link for vimrc
ln -s ~/dotfiles/vimrc ~/.vimrc

# install all plugins
vim +PluginInstall +qall
