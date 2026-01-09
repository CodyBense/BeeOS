{ config, lib, pkgs, ... }:

{
  services.udisks2.enable = true;
  services.gvfs.enable = true;

  # Force start usdisks2
  systemd.services.udisks2 = {
    wantedBy = ["graphical-session.target"];
  };

  environment.systemPackages = with pkgs; [
    gvfs
    udisks2
    gnome-disk-utility
    gparted
    kdePackages.isoimagewriter
    dd_rescue
    pv
  ];
}
