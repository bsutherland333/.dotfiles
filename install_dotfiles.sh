#!/bin/zsh

echo "Installing dotfiles and nvim plugins."

export DOTFILES="$HOME/.dotfiles"

## zsh ##
ln -sf "$DOTFILES/zsh/.zshrc" "$HOME"

## nvim ##
mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.config/nvim/undo"
ln -sf "$DOTFILES/nvim/init.vim" "$HOME/.config/nvim"

## vim-plug ##
[ ! -f "$DOTFILES/nvim/autoload/plug.vim" ] \
    && curl -fLo "$DOTFILES/nvim/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p "$HOME/.config/nvim/autoload"
ln -sf "$DOTFILES/nvim/autoload/plug.vim" "$HOME/.config/nvim/autoload/plug.vim"

nvim --headless --noplugin +PlugUpdate +qa

## ideavim ##
ln -sf "$DOTFILES/ideavim/.ideavimrc" "$HOME"


