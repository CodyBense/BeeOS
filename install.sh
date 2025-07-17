#!/usr/bin/env bash

echo "Enter target host name"

echo $hostName

sudo cp /etc/nixos/hardware-configuration.nix hosts/$hostName/

sudo nixos-rebuild switch --flake .#$hostName

cd /home/$USER
mkdir .config/nvim

git clone https://github.com/CodyBense/dotfiles.git

ln -s $HOME/dotfiles/nvim/.config/nvim $HOME/.config/nvim/
