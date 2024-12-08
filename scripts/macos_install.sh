#!/bin/bash

set -e

echo "Installing dependencies for macOS..."

# Check for Homebrew and install if missing
if ! command -v brew &>/dev/null; then
  echo "Homebrew not found. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install packages via Homebrew
brew install \
  neovim \
  tmux \
  zsh \
  git \
  curl \
  alacritty \
  font-fira-code \
  starship

echo "Dependencies installed."

# Link dotfiles
echo "Linking dotfiles..."
bash ~/dotfiles/scripts/link.sh

# Set Zsh as default shell
if [ "$SHELL" != "/bin/zsh" ]; then
  chsh -s /bin/zsh
  echo "Default shell changed to Zsh. Please log out and log back in for changes to take effect."
fi

echo "Installation completed for macOS!"
