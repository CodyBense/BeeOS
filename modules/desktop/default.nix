{ config, lib, pkgs, ... }:

{
  import = [
    ./niri.nix
    ./audio.nix
    ./browsers.nix
    ./storage.nix
    ./networking.nix
    ./boot.nix
    ./bluetooth.nix
  ];
}
