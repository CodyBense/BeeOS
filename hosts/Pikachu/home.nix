{ config, pkgs, ... }:

{
    home.username = "codybense";
    home.homeDirectory = "/home/codybense";
    home.stateVersion = "25.05";

    home.file.".config/nvim".source = ../../modules/dotfiles/nvim;
}
