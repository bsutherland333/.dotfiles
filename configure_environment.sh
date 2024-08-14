#!/bin/zsh

echo "Installing dotfiles, installing user packages, and configuring system."

export DOTFILES="$HOME/.dotfiles"

## zsh ##
ln -sf "$DOTFILES/zsh/.zshrc" "$HOME"

## vim ##
mkdir -p "$HOME/.config/vim"
mkdir -p "$HOME/.config/vim/undo"
ln -sf "$DOTFILES/vim/.vimrc" "$HOME"

## neovim ##
ln -sf "$DOTFILES/nvim" "$HOME/.config"

## alacritty ##
mkdir -p "$HOME/.config/alacritty"
ln -sf "$DOTFILES/alacritty/alacritty.toml" "$HOME/.config/alacritty"

## oh my zsh ##
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## diff-so-fancy ##
git config --global core.pager "diff-so-fancy | less --tabs=4 -RF"
git config --global interactive.diffFilter "diff-so-fancy --patch"

echo "Configuration complete."
