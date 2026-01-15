# --- 1. Environment & Path Setup ---
typeset -U path cdpath fpath manpath

# Standard Arch/CachyOS paths for completions
fpath=(/usr/share/zsh/site-functions /usr/share/zsh/functions $fpath)

# Help directory for standard ZSH install
HELPDIR="/usr/share/zsh/help"

# --- 2. History Configuration ---
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.zsh_history"

setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_DUPS 
setopt HIST_IGNORE_SPACE 
setopt SHARE_HISTORY

unsetopt APPEND_HISTORY 
unsetopt EXTENDED_HISTORY 
unsetopt HIST_EXPIRE_DUPS_FIRST 
unsetopt HIST_FIND_NO_DUPS
unsetopt HIST_IGNORE_ALL_DUPS 
unsetopt HIST_SAVE_NO_DUPS

# --- 3. Completions & Styling ---
autoload -U compinit && compinit

# Completion Styling (TokyoNight/Standard Fix)
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}" 'ma=48;5;4;fg=15'
zstyle ':completion:*:descriptions' format '%F{#7dcfff}-- %d --%f'

# --- 4. Kitty Integration ---
if [[ -n "$KITTY_INSTALLATION_DIR" ]]; then
  export KITTY_SHELL_INTEGRATION="no-rc"
  autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
  kitty-integration
  unfunction kitty-integration
fi

# --- 5. Plugins (Arch Linux Paths) ---

# Autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history)

# Syntax Highlighting (Must be near the end)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --- 6. Aliases ---
alias c='clear'
alias l='eza -lh --icons=auto'
alias ld='eza -lhD --icons=auto'
alias ll='eza -lha --icons=auto --sort=name --group-directories-first'
alias ls='eza -1 --icons=auto'
alias lt='eza --icons=auto --tree'
alias mount-server='mkdir -p ~/mnt/server && rclone mount home-server: ~/mnt/server --vfs-cache-mode full &'
alias poweroff='systemctl poweroff'
alias reboot='systemctl reboot'
# Replaced Nixos-rebuild with Arch update command
alias update='sudo pacman -Syu' 
alias v='nvim'

# --- 7. Starship Prompt (Must be last) ---
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

alias zz='zi'
