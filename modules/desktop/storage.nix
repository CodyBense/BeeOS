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

  fileSystems."/mnt/vault" = {
    device = "//192.168.1.243/data";
    fsType = "cifs";
    options = let
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
    in ["${automount_opts},credentials=/etc/nixos/smb-secrets,uid=1000,gid=100"];
  };
}
