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

# Load OS-specific configurations
if [[ "$OSTYPE" == "darwin"* ]]; then
  [ -f "$HOME/.dotfiles/macos.zshrc" ] && source "$HOME/.dotfiles/macos.zshrc"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  [ -f "$HOME/.dotfiles/linux.zshrc" ] && source "$HOME/.dotfiles/linux.zshrc"
fi
