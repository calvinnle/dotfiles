#!/bin/bash

set -e

echo "Installing dependencies for Ubuntu..."

# Update and install packages
sudo apt update
sudo apt install -y \
  neovim \
  tmux \
  zsh \
  git \
  curl \
  alacritty \
  fonts-firacode \
  keyd

echo "Dependencies installed."

# Link dotfiles
echo "Linking dotfiles..."
bash ~/dotfiles/scripts/link.sh

# Set Zsh as default shell
if [ "$SHELL" != "$(which zsh)" ]; then
  chsh -s "$(which zsh)"
  echo "Default shell changed to Zsh. Please log out and log back in for changes to take effect."
fi

echo "Installation completed for Ubuntu!"
