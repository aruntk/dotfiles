#install git
sudo pacman -S git

mkdir -p ~/.config/nvim
ln -s vimrc ~/.config/nvim/init.vim
sudo pacman -S neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sudo pacman -S python
sudo pacman -S python-pip
sudo pacman -S gcc
sudo pip install thefuck
# setup clipboard access for nvim
sudo pacman -S xsel
sudo pacman -S xclip
mkdir -p ~/.vim/undo
mkdir -p ~/.vim/backups

#disable tap drag select.. drives me crazy
gsettings set org.gnome.desktop.peripherals.touchpad tap-and-drag false

git config --global core.editor "nvim"


#ZSH config
ln -s zshrc ~/.zshrc
sudo pacman -S zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone git@github.com:zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone git@github.com:zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Gnome Terminal Color Scheme
git clone https://github.com/GalaticStryder/gnome-terminal-colors-dracula
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts/
./install.sh 
cd ..
rm -rf fonts/
cd gnome-terminal-colors-dracula
./install.sh
cd ..
rm -rf gnome-terminal-colors-dracula

#Tmux config
ln -s tmux.conf  ~/.tmux.conf
sudo pacman -S tmux
mkdir -p ~/.tmux/plugins/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
