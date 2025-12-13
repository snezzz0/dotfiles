set -x STARSHIP_CONFIG ~/.config/starship.toml
starship init fish | source
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
