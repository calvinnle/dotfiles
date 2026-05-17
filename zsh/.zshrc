# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# zsh prompts
# ZSH_THEME="agnoster"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="simple"
# ZSH_THEME="apple"
# eval "$(starship init zsh)"

# Default prompt
# PS1="%{$fg[magenta]%}%~%{$fg[red]%} %{$reset_color%}$%b "

# More detailed git status
zstyle ':vcs_info:git:*' formats '%F{red}(%b%c%u%m)%f'
zstyle ':vcs_info:git:*' actionformats '%F{red}(%b|%a%c%u%m)%f'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '%F{green}●'   # Staged changes
zstyle ':vcs_info:git:*' unstagedstr '%F{yellow}●' # Unstaged changes

# Show if you're ahead/behind remote
zstyle ':vcs_info:git*+set-message:*' hooks git-remote-status

+vi-git-remote-status() {
    local ahead behind
    ahead=$(git rev-list --count @{upstream}..HEAD 2>/dev/null)
    behind=$(git rev-list --count HEAD..@{upstream} 2>/dev/null)
    
    if [[ -n $ahead && $ahead -gt 0 ]]; then
        hook_com[misc]="${hook_com[misc]}%F{blue}↑$ahead%f"
    fi
    if [[ -n $behind && $behind -gt 0 ]]; then
        hook_com[misc]="${hook_com[misc]}%F{red}↓$behind%f"
    fi
}

pretty_git_log() {
  git log --graph --pretty="tformat:$FORMAT" $* |
  column -t -s '{' |
  less -XRS --quit-if-one-screen
}


PROMPT='%F{cyan}[%F{yellow}dexter%F{cyan}@%F{magenta}bigmac%F{cyan} %F{blue}%.%F{cyan}]%f${vcs_info_msg_0_} $ '

# Plugins
plugins+=(git zsh-autosuggestions zsh-syntax-highlighting web-search tmux )

source $ZSH/oh-my-zsh.sh

source ~/.config/zsh/alias.zsh
export EDITOR="nvim"

bindkey -v

eval $(thefuck --alias)

# NOTE: FZF
# Use the key-bindings file directly instead
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="/opt/homebrew/opt/mysql/bin:$PATH"
export JAVA_HOME=/opt/homebrew/opt/openjdk@17
export PATH="$HOME/.local/scripts:$PATH"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
export PATH="$PATH:$HOME/flutter/bin"

eval "$(zoxide init zsh)"
export PATH=$PATH:~/zig

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
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

eval "$(direnv hook zsh)"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export MANPAGER="nvim +Man! -c 'set relativenumber' -c 'set number'"
export PATH="/opt/homebrew/opt/man-db/libexec/bin:$PATH"
export FIREFOX_DIR="/Users/lenguyenkhang/Library/Application Support/Firefox/Profiles/6udwhtbs.default-release-1769943768355"

pretty_git_log() {
  git log --graph --pretty="tformat:$FORMAT" $* |
  column -t -s '{' |
  less -XRS --quit-if-one-screen
}



# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/lenguyenkhang/.opam/opam-init/init.zsh' ]] || source '/Users/lenguyenkhang/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration
