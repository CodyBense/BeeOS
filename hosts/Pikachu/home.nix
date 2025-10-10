{ config, pkgs, ... }:

{
    home.username = "codybense";
    home.homeDirectory = "/home/codybense";
    home.stateVersion = "25.05";

    home.file.".config/starship.toml".source = ../../modules/dotfiles/starship.toml;
    home.file.".bashrc".source = ../../modules/dotfiles/.bashrc;
    home.file.".bash_profile".source = ../../modules/dotfiles/.bash_profile;
}
