# Amazo Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]]\
&& builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# All my favorite ZSH Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="agnoster"
ZSH_THEME="robbyrussell"
# ZSH_THEME="simple"
# ZSH_THEME="apple"
#
# Default prompt
PS1="%{$fg[magenta]%}%~%{$fg[red]%} %{$reset_color%}$%b "
# Plugins
plugins+=(git zsh-autosuggestions zsh-syntax-highlighting web-search tmux )

source $ZSH/oh-my-zsh.sh

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
 
source ~/.config/zsh/alias.zsh
export EDITOR="nvim"

bindkey -v

eval $(thefuck --alias)

# NOTE: FZF
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"


if [ -f ~/.vscode-zshrc ]; then
  source ~/.vscode-zshrc
fi

# Functions
function lsPretty() {
	eza --time-style relative $1
}

function llPretty() {
	eza -l --time-style relative $1
}

export PATH="/opt/homebrew/opt/mysql/bin:$PATH"
export JAVA_HOME=/opt/homebrew/opt/openjdk@17
export PATH="$HOME/.local/scripts:$PATH"

# eval "$(starship init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]]\
    && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
export PATH="$PATH:$HOME/flutter/bin"

eval "$(zoxide init zsh)"
export PATH=$PATH:~/zig

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval "$(~/.local/bin/mise activate)"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export CPLUS_INCLUDE_PATH=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/c++/v1

[[ -s "/Users/lenguyenkhang/.gvm/scripts/gvm" ]] && source "/Users/lenguyenkhang/.gvm/scripts/gvm"
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

# android setup
export ANDROID_HOME=/Users/lenguyenkhang/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

bindkey -s ^f "tmux-sessionizer\n"
