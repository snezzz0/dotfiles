if test (tty) = "/dev/tty1"
  exec Hyprland
end

if status is-interactive
    fastfetch
end
set -x STARSHIP_CONFIG ~/.config/starship.toml
starship init fish | source
