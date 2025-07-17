#!/usr/bin/env bash

echo "Building from config"
echo "Enter target host name"

echo $hostName

sudo cp /etc/nixos/hardware-configuration.nix hosts/$hostName/

sudo nixos-rebuild switch --flake .#$hostName

echo "Linking nvim config"

cd /home/$USER

git clone https://github.com/CodyBense/dotfiles.git
mkdir .config/nvim

ln -s $HOME/dotfiles/nvim/.config/nvim $HOME/.config/nvim/

echo "Adding flatpaks"

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install flathub app.zen_browser.zen

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
