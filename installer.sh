#!/bin/bash
# CachyOS Package Installation Script
# Just installs all the packages you use

set -e  # Exit on error

echo "🚀 Installing packages on CachyOS..."

# ============================================================================
# Update System
# ============================================================================
echo "📦 Updating system..."
sudo pacman -Syu --noconfirm

# ============================================================================
# Install Essential Packages
# ============================================================================
echo "📦 Installing essential packages..."
sudo pacman -S --noconfirm \
    base-devel \
    git \
    stow \
    wget \
    curl \
    unzip

# ============================================================================
# Install AUR Helper (yay)
# ============================================================================
if ! command -v yay &> /dev/null; then
    echo "📦 Installing yay (AUR helper)..."
    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ~
fi

# ============================================================================
# Development Tools
# ============================================================================
echo "📦 Installing development tools..."
yay -S --noconfirm \
    neovim \
    gcc \
    rust \
    nodejs \
    npm \
    python \
    python-pip

# ============================================================================
# Shell & Terminal Tools
# ============================================================================
echo "📦 Installing shell tools..."
yay -S --noconfirm \
    zsh \
    zsh-autosuggestions \
    zsh-syntax-highlighting \
    starship \
    eza \
    ripgrep \
    fd \
    zoxide \
    fzf \
    tmux \
    yazi

# ============================================================================
# Desktop Applications
# ============================================================================
echo "📦 Installing desktop applications..."
yay -S --noconfirm \
    kitty \
    brave-bin \
    firefox \
    obsidian \
    dbeaver \
    gimp \
    mpv \
    pavucontrol \
    seahorse

# ============================================================================
# Window Manager & Desktop Tools
# ============================================================================
echo "📦 Installing window manager and tools..."
yay -S --noconfirm \
    hyprland \
    xwayland \
    swaybg \
    wlogout \
    rofi \
    dunst \
    feh \
    waybar

# ============================================================================
# System Utilities
# ============================================================================
echo "📦 Installing system utilities..."
yay -S --noconfirm \
    rclone \
    libqalculate \
    gvfs \
    tumbler \
    pulseaudio \
    bibata-cursor-theme

# ============================================================================
# Fonts
# ============================================================================
echo "🔤 Installing fonts..."
yay -S --noconfirm \
    ttf-firacode-nerd \
    ttf-jetbrains-mono-nerd \
    ttf-nerd-fonts-symbols-mono
    ttf-victor-mono-nerd

# ============================================================================
# Python Tools (uv)
# ============================================================================
echo "🐍 Installing uv (Python package manager)..."
curl -LsSf https://astral.sh/uv/install.sh | sh

# ============================================================================
# Change Default Shell to ZSH
# ============================================================================
echo "🐚 Setting ZSH as default shell..."
if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s $(which zsh)
    echo "✅ ZSH set as default shell (logout required)"
fi

# ============================================================================
# Finish
# ============================================================================
echo ""
echo "✅ All packages installed!"
echo ""
echo "📋 Next steps:"
echo "  1. Clone your dotfiles: git clone https://github.com/YOUR_USERNAME/dotfiles"
echo "  2. Stow your configs: cd dotfiles && stow */"
echo "  3. Logout and back in (for ZSH)"
echo "  4. Reboot for all changes to apply"
echo ""
echo "🎉 Done!"
