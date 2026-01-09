# Dotfiles

>[!Note]
Archived a few modules, they are now managed by [NixOS](https://github.com/snezzz0/nixos-btw)

A collection of configuration files optimized for **GNU Stow**.

## 🚀 Installation

These dotfiles are intended to be cloned into your home directory (usually `~/dotfiles`).

### 1. Prerequisites

Ensure you have **GNU Stow** installed on your system.

#### NixOS
Add `stow` to your `configuration.nix` or use a shell:
```bash
nix-shell -p stow
```

#### Arch Linux
```bash
sudo pacman -S stow
```

#### Debian / Ubuntu
```bash
sudo apt install stow
```

#### Fedora
```bash
sudo dnf install stow
```

#### macOS (Homebrew)
```bash
brew install stow
```

### 2. Clone the Repository

```bash
git clone https://github.com/snezzz0/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 3. Deploying Configurations

Use the `stow` command to symlink specific modules to your home directory.

> [!WARNING]
> You must remove existing configuration files (like `~/.zshrc`) before stowing, otherwise Stow will fail due to a conflict.

#### Example: Deploying specific modules
```bash
stow zsh
stow kitty
```

#### Deploying everything at once
```bash
stow zsh kitty niri waybar yazi rofi dunst nvim
```

## 📦 Components & Dependencies

| Component | Target Location | Recommended Package |
| :--- | :--- | :--- |
| **Zsh** | `~/.zshrc`, `~/.p10k.zsh` | `zsh`, `p10k` |
| **Kitty** | `~/.config/kitty/` | `kitty` |
| **Niri** | `~/.config/niri/` | `niri` |
| **Waybar** | `~/.config/waybar/` | `waybar` |
| **Yazi** | `~/.config/yazi/` | `yazi` |
| **Rofi** | `~/.config/rofi/` | `rofi-wayland` |
| **Dunst** | `~/.config/dunst/` | `dunst` |
| **Nvim** | `~/.config/nvim/` | `neovim` |
