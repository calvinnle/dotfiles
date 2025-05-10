# My MacOS Configurations

My personal dotfiles repository containing configuration files for various tools and applications I use daily. These are the configs I spend 90% of my time in — obsessively tuned, occasionally broken, and always evolving.

![Neovim Setup](assets/editor.png)

## 🛠️ Main Tools

- [Homebrew](https://brew.sh/) - Package manager for macOS
- [Neovim](https://neovim.io/) - Text editor
- [Tmux](https://github.com/tmux/tmux) - Terminal multiplexer
- [Ghostty](https://github.com/mitchellh/ghostty) - Terminal emulator
- [WezTerm](https://wezfurlong.org/wezterm/) - Terminal emulator
- [Aerospace](https://aerospace.app/) - Window manager (i3-like for macOS)
- [Zsh](https://www.zsh.org/) - Shell configuration

## 🚀 Installation

### For macOS Users

#### Prerequisites
1. Install Homebrew (package manager):
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Install git:
```bash
brew install git
```

#### Option 1: Automated Setup (Recommended)
1. Clone this repository:
```bash
git clone https://github.com/calvinnle/dotfiles.git ~/dotfiles
```

2. Run the macOS setup script to install all required packages:
```bash
cd ~/dotfiles
chmod +x macos_setup.sh
./macos_setup.sh
```

3. Create symlinks using the link script:
```bash
chmod +x link.sh
./link.sh
```

#### Option 2: Manual Installation
1. Install all required tools:
```bash
brew install nvim tmux zsh bat fzf ripgrep wget
brew install --cask ghostty wezterm
```

2. Install Nerd Fonts:
```bash
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font font-fira-code-nerd-font
```

3. Clone and setup dotfiles:
```bash
git clone https://github.com/calvinnle/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x link.sh
./link.sh
```

## 📝 Important Notes

- Use a modern terminal emulator (iTerm2, WezTerm, Ghostty) as the default macOS terminal cannot properly display themes
- Install Nerd Fonts for proper display of icons, text, and folder symbols
- Required tools for Neovim:
  - `ripgrep` for Telescope live grep
  - `wget` for Mason to download packages

## 📁 Structure

```
dotfiles/
├── aerospace/     # Aerospace window manager config
├── alacritty/     # Alacritty terminal config
├── nvim/          # Neovim configuration
├── starship/      # Starship prompt config
├── ghostty/       # Ghostty terminal config
├── fastfetch/     # Fastfetch config
├── wezterm/       # WezTerm config
├── zsh/           # Zsh configuration files
│   ├── .zshrc
│   └── alias.zsh
├── tmux/          # Tmux configuration
└── link.sh        # Installation script
```

## 🔮 Future Enhancements

Stuff I'd love to add if I had more time (and motivation):

- **GNU Stow**: Heard about this symlink management tool ages ago, but my current `link.sh` works just fine. So I'm in no rush. 
- **Nix**: The holy grail of reproducible environments. Sounds amazing, but learning Nix feels like learning a new language. Maybe next year? 
- **Sketchybar**: Would make my setup look extra pretty. But not exactly a priority when everything works smoothly.

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Feel free to open issues or submit pull requests if you have suggestions for improvements. 