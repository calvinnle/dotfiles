#!/bin/bash

# Install Homebrew if it's not installed
if ! command -v brew &> /dev/null; then
  echo "Homebrew not found, installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew is already installed."
fi

# Install essential packages using Homebrew
echo "Installing essential packages..."
brew install \
  git \
  zsh \
  nvm \
  fzf \
  tmux \
  neovim \
  ripgrep \
  wget \
  lazydocker \
  bat

# Install terminal emulators
echo "Installing terminal emulators..."
brew install --cask ghostty wezterm

# Install Nerd Fonts
echo "Installing Nerd Fonts..."
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font font-fira-code-nerd-font

echo "Essential packages installation complete!"
echo "Next steps:"
echo "1. Clone your dotfiles repository"
echo "2. Run link.sh to create symlinks"
echo "3. Configure your tools"

