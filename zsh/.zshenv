# zshenv, always sourced and sourced first. Place environment variables here.

## Define XDG locations

# For dotfiles
export XDG_CONFIG_HOME="$HOME/.config"

# For specific data
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"

# For cached files
export XDG_CACHE_HOME="$HOME/.cache"

# Add flatpak bin to path
export XDG_DATA_DIRS="$XDG_DATA_HOME/flatpak/exports/share:$XDG_DATA_DIRS"

## Misc definitions

# Alternate zsh dotfile location
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
