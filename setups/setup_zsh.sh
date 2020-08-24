# install zsh
sudo apt install --yes zsh

# install curl
sudo apt install --yes curl

# install oh-my-zsh
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# link to zshrc
rm ~/.zshrc
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc

# link aliases
ln -s ~/dotfiles/zsh/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh

# create plugins folder
mkdir ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins
mkdir ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes

# install fish-like autosuggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# install 256-color plugin
( cd ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins && git clone https://github.com/chrissicool/zsh-256color )

# install powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# install shell scripts
# install ad - advance-touch
pip install --user advance-touch
# install fd - better find
sudo apt install --yes fd-find
# install neofetch
sudo apt install --yes neofetch
# install cmatrix
sudo apt install libncurses5-dev
git clone git@github.com:abishekvashok/cmatrix.git
cd cmatrix
autoreconf -i
./configure
make
sudo make install
cd ..
rm -rf cmatrix

# change shell to zsh
chsh -s $(which zsh)
