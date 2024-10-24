# Dotfiles

This repository contains the dotfiles I use for both my system configuration and my development environment.
My system configuration is built on top of the Fedora Sway spin, while my development environment is built around LazyVim and other terminal/keyboard focused tools.

The install_system_packages.sh script will install all the necessary dependencies for my development environment on an Ubuntu system.
I maintain this script mostly for use with docker/podman containers, I don't recommend using it on your host system.
Better to use it as a reference instead and manually complete all the same installations for the respective system.

configure_environment.sh should be safe to run on any system as it does not require root and just links dotfiles to their respective locations.

