#!/usr/bin/env bash

# if ! [ "$(id -u)" = 0 ]; then
#     echo "The script needs to be run as root" >&2
#     exit 1
# fi

echo "Building from config"

read -p "Enter target host name, defaults to Revan if none entered: " hostName

if [ -z "$hostName" ]; then
    hostName=Revan
fi

if [ ! -d "$HOME"/BeeOS/hosts/"$hostName" ]; then
    echo "Making dir "$hostName" at "$HOME"/BeeOS/hosts"
    mkdir -p "$HOME"/BeeOS/hosts/"$hostName"
    cat /etc/nixos/configuration.nix >> "$HOME"/BeeOS/hosts/"$hostName"
    cat /etc/nixos/hardware-configuration.nix >> "$HOME"/BeeOS/hosts/"$hostName"
    cp hosts/Test/home.nix host/"$hostName"/
fi

cat /etc/nixos/hardware-configuration.nix >> hosts/"$hostName"/hardware-configuration.nix

sleep 1

echo "Building for "$hostName""

sudo nixos-rebuild switch --flake .#"$hostName"

# echo "Linking nvim config"
#
# cd /home/"$USER"
#
# git clone https://github.com/CodyBense/dotfiles.git
# mkdir .config/nvim
#
# ln -s "$HOME"/dotfiles/nvim/.config/nvim "$HOME"/.config/nvim/
#
echo "Creating directories"

if [ ! -d "$HOME"/workspaces/github.com/CodyBense ]; then
    mkdir -p "$HOME"/workspaces/github.com/CodyBense
fi

if [ ! -d "$HOME"/workspaces/projects ]; then
    mkdir -p "$HOME"/workspaces/projects
fi

# echo "Adding info for samba share"
read -p "Do you want ot add info for a samba share: (y/N)" sambaConf 

if [ "$sambaConf" = "y" ]; then
    read -p "Enter username for vault samba share: " username
    read -p "Enter passwrod for vault samba share: " password

    echo -e "username=${username}\npassword=${password}" >> /etc/nixos/smb-secrets
fi    


echo "Completed setup"
echo "Restarting..."
reboot
