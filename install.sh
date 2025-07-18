#!/usr/bin/env bash

echo "Building from config"

read -p "Enter target host name, defaults to laptop if none entered: " hostName

if [ -z "$hostName" ]; then
    hostname=laptop
fi

sudo cp /etc/nixos/hardware-configuration.nix hosts/$hostName/

sudo nixos-rebuild switch --flake .#$hostName

echo "Linking nvim config"

cd /home/$USER

git clone https://github.com/CodyBense/dotfiles.git
mkdir .config/nvim

ln -s $HOME/dotfiles/nvim/.config/nvim $HOME/.config/nvim/

echo "Creating directories"

if [ ! -d $HOME/workspaces/github.com/CodyBense ]; then
    mkdir -p $HOME/workspaces/github.com/CodyBense
fi

if [ ! -d $HOME/workspaces/Projects ]; then
    mkdir -p $HOME/workspaces/Projects
fi

echo "Completed setup"
echo "Restarting"
reboot
