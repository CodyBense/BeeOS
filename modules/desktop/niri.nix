{ config, lib, pkgs, ... }:

{
  progrmas.niri.enable = true;

  security.polkit.enable = true; #polkit
  services.gnome.gnome-keyring.enable = true; #secret service

  environment.sessionVariable.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];
}
