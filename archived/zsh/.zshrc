# --- 1. Environment & Path Setup ---
typeset -U path cdpath fpath manpath
for profile in ${(z)NIX_PROFILES}; do
  fpath+=($profile/share/zsh/site-functions $profile/share/zsh/$ZSH_VERSION/functions $profile/share/zsh/vendor-completions)
done

HELPDIR="/nix/store/gm8ldbac46x710xlmxanblzvw4yimjzd-zsh-5.9/share/zsh/$ZSH_VERSION/help"

# --- 2. History Configuration ---
HISTSIZE="10000"
SAVEHIST="10000"
HISTFILE="/home/adam/.zsh_history"
mkdir -p "$(dirname "$HISTFILE")"

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

# --- 3. Completions & Plugins ---
autoload -U compinit && compinit

# Autosuggestions
source /nix/store/9vjgzqbj1i9qqznrqvh4g6k5kvd89y4v-zsh-autosuggestions-0.7.1/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history)

# Completion Styling (TokyoNight Fix)
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}" 'ma=48;5;4;fg=15'
zstyle ':completion:*:descriptions' format '%F{#7dcfff}-- %d --%f'

# --- 4. Kitty Integration ---
if test -n "$KITTY_INSTALLATION_DIR"; then
  export KITTY_SHELL_INTEGRATION="no-rc"
  autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
  kitty-integration
  unfunction kitty-integration
fi

# --- 5. Aliases ---
alias c='clear'
alias l='eza -lh --icons=auto'
alias ld='eza -lhD --icons=auto'
alias ll='eza -lha --icons=auto --sort=name --group-directories-first'
alias ls='eza -1 --icons=auto'
alias lt='eza --icons=auto --tree'
alias mount-server='mkdir -p ~/mnt/server && rclone mount home-server: ~/mnt/server --vfs-cache-mode full &'
alias poweroff='systemctl poweroff'
alias reboot='systemctl reboot'
alias rebuild='sudo nixos-rebuild switch --flake .#nixos-btw'
alias umount-server='fusermount -u ~/mnt/server'
alias v='nvim'

# --- 6. Syntax Highlighting (Must be near the end) ---
source /nix/store/6aqwmp96p7gcmlsq1clvfhyh1s7afc0f-zsh-syntax-highlighting-0.8.0/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --- 7. Starship Prompt (Must be last) ---
eval "$(starship init zsh)"
