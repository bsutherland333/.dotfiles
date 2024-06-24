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
    ubuntu|pop)
        echo "Detected Ubuntu or Pop!_OS."
        sudo apt-get update

        # Add ppa repos
        sudo apt-get install software-properties-common -y
        sudo add-apt-repository ppa:neovim-ppa/stable -y
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
            -y
        ;;
    fedora)
        echo "Detected Fedora."

        # Install packages
        sudo dnf install --assumeyes \
            neovim \
            zsh \
            fzf \
            ripgrep \
            diff-so-fancy
        ;;
    *)
        echo "Unsupported distribution: $DISTRIBUTION. Cannot install packages."
        exit 1
        ;;
esac

# Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Setup diff-so-fancy
git config --global core.pager "diff-so-fancy | less --tabs=4 -RF"
git config --global interactive.diffFilter "diff-so-fancy --patch"

echo "Package installation complete."

