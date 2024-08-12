#!/bin/zsh

echo "Installing dotfiles and nvim plugins."

export DOTFILES="$HOME/.dotfiles"

## zsh ##
ln -sf "$DOTFILES/zsh/.zshrc" "$HOME"

## vim ##
mkdir -p "$HOME/.config/vim"
mkdir -p "$HOME/.config/vim/undo"
ln -sf "$DOTFILES/vim/.vimrc" "$HOME"

## neovim ##
ln -sf "$DOTFILES/nvim" "$HOME/.config"

