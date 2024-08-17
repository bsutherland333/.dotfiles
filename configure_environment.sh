#!/bin/zsh

echo "Installing dotfiles, installing user packages, and configuring system."

export DOTFILES="$HOME/.dotfiles"

## zsh ##
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
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

## diff-so-fancy ##
git config --global core.pager "command -v diff-so-fancy >/dev/null 2>&1 && diff-so-fancy | less --tabs=4 -RF || less"
git config interactive.diffFilter "$HOME/.config/diff-so-fancy/dsf-filter"

git config --global color.ui true

git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

git config --global color.diff.meta       "11"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.func       "146 bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"

mkdir -p "$HOME/.config/diff-so-fancy"
ln -sf "$DOTFILES/diff-so-fancy/dsf-filter" "$HOME/.config/diff-so-fancy"

echo "Configuration complete."
