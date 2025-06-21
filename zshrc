# Modernized .zshrc - Updated for 2025
# =====================================

# Oh My Zsh Configuration
# -----------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="dracula"

# Oh My Zsh Settings
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="false"
export UPDATE_ZSH_DAYS=7  # Check for updates weekly instead of bi-weekly
DISABLE_LS_COLORS="false"
DISABLE_AUTO_TITLE="false"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"  # Better performance for large repos
HIST_STAMPS="yyyy-mm-dd"  # ISO date format

# Plugin Configuration
# --------------------
plugins=(
    git
    fast-syntax-highlighting  # Faster alternative to zsh-syntax-highlighting
    macos  # Updated from deprecated 'osx'
    yarn
    npm
    node
    zsh-autosuggestions
    zsh-autocomplete         # Advanced autocompletion
    colored-man-pages
    extract
    z
    fzf                      # Fuzzy finder integration
    history-substring-search # Search history with up/down arrows
    sudo                     # Double press ESC to add sudo
    copypath                 # Copy current path to clipboard
    copyfile                 # Copy file contents to clipboard
    web-search              # Search web from terminal
)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Environment Variables
# --------------------
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Editor Configuration
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nano'  # More user-friendly than vim for most users
else
    export EDITOR='code'  # VS Code as default editor
fi

# Path Configuration
# -----------------
# Clean up and modernize PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"  # Homebrew (Apple Silicon)
export PATH="/usr/local/bin:$PATH"  # Homebrew (Intel)
export PATH="$HOME/.node/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"

# Python path - use more generic approach
if [[ -d "$HOME/Library/Python" ]]; then
    for python_dir in "$HOME/Library/Python"/*/bin; do
        if [[ -d "$python_dir" ]]; then
            export PATH="$python_dir:$PATH"
        fi
    done
fi

# Java Configuration
# -----------------
if [[ -x /usr/libexec/java_home ]]; then
    export JAVA_HOME=$(/usr/libexec/java_home 2>/dev/null)
fi

# Node.js Configuration
# --------------------
# Add common Node version managers
if [[ -d "$HOME/.nvm" ]]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi

# pnpm
# if [[ -d "$HOME/.local/share/pnpm" ]]; then
#    export PNPM_HOME="$HOME/.local/share/pnpm"
#    export PATH="$PNPM_HOME:$PATH"
# fi

# Zsh Completions
# --------------
# if [[ -d "/opt/homebrew/share/zsh-completions" ]]; then
#    fpath=("/opt/homebrew/share/zsh-completions" $fpath)
# elif [[ -d "/usr/local/share/zsh-completions" ]]; then
#    fpath=("/usr/local/share/zsh-completions" $fpath)
# fi

# Load custom configurations
# -------------------------
# Load sensitive environment variables
if [[ -f "$HOME/.sensitive" ]]; then
    source "$HOME/.sensitive"
fi

# Load custom aliases
if [[ -f "$HOME/.aliases" ]]; then
    source "$HOME/.aliases"
fi

# Built-in Aliases
# ---------------
alias dcount="echo \"Downloads: \$(ls ~/Downloads/ | wc -l | tr -d ' ') files\""
alias zshconfig="$EDITOR ~/.zshrc"
alias reload="source ~/.zshrc"

# Modern replacements for common commands (install with homebrew)
if command -v exa >/dev/null 2>&1; then
    alias ls="exa"
    alias ll="exa -la"
    alias tree="exa --tree"
fi

if command -v bat >/dev/null 2>&1; then
    alias cat="bat"
fi

if command -v fd >/dev/null 2>&1; then
    alias find="fd"
fi

# Git aliases
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git pull"

# Python aliases - use python3 explicitly
alias python="python3"
alias pip="pip3"

# Development aliases
alias ll="ls -la"
alias la="ls -la"
alias ..="cd .."
alias ...="cd ../.."

# Performance Optimizations
# -------------------------
# Disable oh-my-zsh auto-update check for faster startup
DISABLE_UPDATE_PROMPT=true

# History Configuration
# --------------------
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS

# Modern Terminal Features
# -----------------------
# Enable better completion
autoload -Uz compinit
compinit

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Better kill completion
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# FZF Configuration (if installed)
if command -v fzf >/dev/null 2>&1; then
    # Use fd instead of find for fzf if available
    if command -v fd >/dev/null 2>&1; then
        export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
        export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    fi
    
    # Better preview with bat if available
    if command -v bat >/dev/null 2>&1; then
        export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {}'"
    fi
fi

# Key bindings for history-substring-search
if [[ -n "${plugins[(r)history-substring-search]}" ]]; then
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
    bindkey -M vicmd 'k' history-substring-search-up
    bindkey -M vicmd 'j' history-substring-search-down
fi

# Load custom functions
# --------------------
if [[ -d "$HOME/.zsh_functions" ]]; then
    fpath=("$HOME/.zsh_functions" $fpath)
    autoload -Uz $HOME/.zsh_functions/*(:t)
fi

# Final PATH cleanup
# -----------------
# Remove duplicate entries from PATH
typeset -U PATH

# Optional: Load additional tools
# ------------------------------
# FZF (Fuzzy Finder) - Now included in plugins above
if [[ -f ~/.fzf.zsh ]]; then
    source ~/.fzf.zsh
fi

# Starship prompt (modern alternative to oh-my-zsh themes)
# Uncomment to use Starship instead of Dracula theme
# if command -v starship >/dev/null 2>&1; then
#     eval "$(starship init zsh)"
# fi

# Zoxide (better cd)
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
    alias cd="z"
fi

# Installation commands for modern plugins:
# -----------------------------------------
# Run these commands to install the modern plugins:
#
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete
# git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
#
# For FZF: brew install fzf && $(brew --prefix)/opt/fzf/install
# For modern CLI tools: brew install exa bat fd ripgrep zoxide starship
