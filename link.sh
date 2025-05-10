#!/bin/bash

set -e  # Exit on errors

# Define base directories
DOTFILES_DIR=~/dotfiles

# Ensure .config directory exists
mkdir -p ~/.config

# Create symlinks for configuration files
ln -svnf $DOTFILES_DIR/aerospace ~/.config/aerospace
ln -svnf $DOTFILES_DIR/alacritty ~/.config/alacritty
ln -svnf $DOTFILES_DIR/nvim ~/.config/nvim
ln -svnf $DOTFILES_DIR/starship ~/.config/starship
ln -svnf $DOTFILES_DIR/ghostty ~/.config/ghostty
ln -svnf $DOTFILES_DIR/fastfetch ~/.config/fastfetch
ln -svnf $DOTFILES_DIR/wezterm/.wezterm.lua ~/.wezterm.lua

# Additional symlinks for specific files
ln -svnf $DOTFILES_DIR/zsh/.zshrc ~/.zshrc
ln -svnf $DOTFILES_DIR/zsh/alias.zsh ~/.config/zsh/alias.zsh
ln -svnf $DOTFILES_DIR/starship/starship.toml ~/.config/starship.toml
ln -svnf $DOTFILES_DIR/tmux/.tmux.conf ~/.tmux.conf

# Print completion message
echo "Symlinks created successfully!"

