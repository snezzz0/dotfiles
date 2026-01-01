# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- Custom Functions ---

# Show color with hex colors
hexcolor() {
    for hex in "$@"; do
        printf "\033[48;2;%d;%d;%dm  \033[0m %s\n" \
            "0x${hex:1:2}" "0x${hex:3:2}" "0x${hex:5:2}" "$hex"
    done
}

# --- Completion & Suggestion Colors ---
autoload -U colors && colors

# Set custom colors for autocomplete (completion menu)
zstyle ':completion:*' list-colors "di=1;34:fi=0:ln=1;36:pi=1;33:so=1;35:bd=1;33:cd=1;33:or=1;31:mi=1;31:*.sh=1;32:*.txt=1;33"

# Set color for autosuggestions (gray)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#8A8A8A'

# --- Aliases ---

# General
alias c='clear'
alias l='eza -lh --icons=auto'
alias ls='eza -1 --icons=auto'
alias ll='eza -lha --icons=auto --sort=name --group-directories-first'
alias ld='eza -lhD --icons=auto'
alias lt='eza --icons=auto --tree'
alias z='zeditor'
alias poweroff='systemctl poweroff'
alias restart='systemctl reboot'
alias logout='niri msg action quit'
alias rebuild='sudo nixos-rebuild switch'
alias yz='yazi'

# NixOS package management
alias update='sudo nixos-rebuild switch'
alias search='nix search nixpkgs'
alias clean='nix-collect-garbage -d'
alias list='nix-env -q'

# Directory shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias mkdir='mkdir -p'

# NVIM
alias nv='nvim'

# --- Custom PATH ---
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export EDITOR="hx"

# --- Powerlevel10k Config ---
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
