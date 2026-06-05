# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# Aliases end

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# nvm end

# Oh My Posh
eval "$(oh-my-posh init zsh --config ~/.dotfiles/.mytheme.omp.json)"
# End of Oh My Posh

# Added by Antigravity
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"

# Added by Antigravity CLI installer
export PATH="$HOME/.local/bin:$PATH"

# Added by Antigravity IDE
export PATH="$HOME/.antigravity-ide/antigravity-ide/bin:$PATH"

# Load OS-specific configurations
if [[ "$OSTYPE" == "darwin"* ]]; then
  [ -f "$HOME/.dotfiles/zshrc.macos" ] && source "$HOME/.dotfiles/zshrc.macos"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  [ -f "$HOME/.dotfiles/zshrc.linux" ] && source "$HOME/.dotfiles/zshrc.linux"
fi
