echo "installing homebrew, python3 and other deps"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install python3
pip3 install thefuck

echo "setting up zsh"
brew install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv ~/.zshrc ~/.zshrc.old
ln -s ~/personal/dotfiles/zshrc ~/.zshrc
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
brew install zsh-completions
brew install zsh-syntax-highlighting zsh-autosuggestions
mkdir ~/deps
cd ~/deps
git clone https://github.com/dracula/zsh.git
cd .oh-my-zsh/themes
ln -s ~/deps/zsh/dracula.zsh-theme ~/dracula.zsh-theme
cd

echo "setting up tmux"
brew install tmux
ln -s ~/personal/dotfiles/tmux.conf ~/.tmux.conf

cd ~/deps
git clone https://github.com/dracula/iterm.git
echo "change iterm colors to dracula"
cd

brew install cmake macvim
brew install neovim
mkdir -p ~/.config/nvim/
ln -s ~/personal/dotfiles/vimrc ~/.config/nvim/init.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \\
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim -c PlugInstall -c q
cd ~/.local/share/nvim/plugged/youcompleteme
./install.py --java-completer --ts-completer
