#!/bin/bash

# macOS Setup Script - Updated for 2025
# Make sure to run this with bash, not sh

set -e  # Exit on any error

echo "🍺 Installing Homebrew and essential tools..."

# Check if Homebrew is already installed
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo "Homebrew already installed, updating..."
    brew update
fi

# Install Python 3 (now comes with pip by default)
brew install python3

# Install thefuck (now available via brew)
brew install thefuck

echo "🐚 Setting up Zsh (default shell since macOS Catalina)..."

# Zsh is now the default shell, but install latest version via brew
brew install zsh

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Backup existing zshrc and create symlink
if [ -f ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.backup.$(date +%Y%m%d_%H%M%S)
fi
ln -sf ~/personal/dotfiles/zshrc ~/.zshrc

# Install Zsh plugins
brew install zsh-completions zsh-syntax-highlighting zsh-autosuggestions

# Set up Dracula theme
mkdir -p ~/deps
cd ~/deps
if [ ! -d "zsh" ]; then
    git clone https://github.com/dracula/zsh.git
fi
ln -sf ~/deps/zsh/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme

echo "🖥️ Setting up Tmux..."
cd "$HOME"

brew install tmux
ln -sf ~/personal/dotfiles/tmux.conf ~/.tmux.conf

# Install TPM (Tmux Plugin Manager)
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Set up Dracula theme for iTerm2
cd ~/deps
if [ ! -d "iterm" ]; then
    git clone https://github.com/dracula/iterm.git
fi
echo "📱 Apply Dracula theme: iTerm2 > Preferences > Profiles > Colors > Color Presets > Import ~/deps/iterm/Dracula.itermcolors"

echo "✏️ Setting up Neovim..."
cd "$HOME"

# Install dependencies
brew install cmake neovim

# Modern Neovim configuration
mkdir -p ~/.config/nvim/

# Use init.lua instead of init.vim for modern Neovim
if [ -f ~/personal/dotfiles/init.lua ]; then
    ln -sf ~/personal/dotfiles/init.lua ~/.config/nvim/init.lua
elif [ -f ~/personal/dotfiles/vimrc ]; then
    ln -sf ~/personal/dotfiles/vimrc ~/.config/nvim/init.vim
fi

# Create necessary directories
mkdir -p ~/.vim/backups ~/.vim/undo ~/.vim/swaps
mkdir -p ~/.local/share/nvim/site/autoload

# Install vim-plug (still popular, but consider lazy.nvim for new configs)
if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Install plugins (if using vim-plug)
if grep -q "plug#begin" ~/.config/nvim/init.vim 2>/dev/null || grep -q "plug#begin" ~/.config/nvim/init.lua 2>/dev/null; then
    nvim --headless +PlugInstall +qall
fi

echo "🛠️ Installing additional development tools..."

# Modern development tools
brew install --cask iterm2 visual-studio-code
brew install git node yarn ripgrep fd bat eza fzf tree-sitter
brew install gh  # GitHub CLI

# Install fonts (including programming fonts)
brew tap homebrew/cask-fonts
brew install --cask font-fira-code font-jetbrains-mono font-cascadia-code

echo "🔧 Setting up Git (configure with your details)..."
echo "Run these commands with your information:"
echo "git config --global user.name \"Your Name\""
echo "git config --global user.email \"your.email@example.com\""
echo "git config --global init.defaultBranch main"

echo "📦 Optional: Install additional apps..."
echo "Consider running: brew install --cask docker slack spotify rectangle"

echo "🎉 Setup complete! Restart your terminal or run 'source ~/.zshrc'"
echo ""
echo "📝 Next steps:"
echo "1. Configure Git with your credentials"
echo "2. Import Dracula theme in iTerm2"
echo "3. Review and update your dotfiles"
echo "4. Install any additional development tools you need"
echo ""
echo "🚀 Happy coding!"
