#!/bin/bash

# Function to check it a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Detect current distribution
if [ -f /etc/os-release ]; then
  . /etc/os-release
  DISTRIBUTION=$ID
elif [ -f /etc/lsb-release ]; then
  . /etc/lsb-release
  DISTRIBUTION=$DISTRIB_ID
else
  DISTRIBUTION="unknown"
fi

case $DISTRIBUTION in
ubuntu)
  echo "Detected Ubuntu."
  sudo apt-get update

  # Add ppa repos
  sudo apt-get install software-properties-common -y
  sudo add-apt-repository ppa:neovim-ppa/unstable -y
  sudo add-apt-repository ppa:aos1/diff-so-fancy -y

  # Install apt packages
  sudo apt-get install \
    man-db \
    neovim \
    zsh \
    fzf \
    ripgrep \
    less \
    tree \
    curl \
    diff-so-fancy \
    vim \
    -y

  # Install LazyVim dependencies
  sudo apt-get install \
    fd-find \
    python3-neovim \
    python3-pip \
    luarocks \
    fish \
    -y
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar xf lazygit.tar.gz lazygit
  install lazygit /usr/local/bin
  sudo rm -rf lazygit.tar.gz lazygit
  ;;
*)
  echo "Unsupported distribution: $DISTRIBUTION. Install packages manually."
  exit 1
  ;;
esac

echo "Package installation complete."
