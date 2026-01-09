{ config, lib, pkgs, ... }:

{
  boot.plymouth = {
    enable = true;
    theme = "breeze";
  };

  boot.kernelParams = {
    "quiet"
    "splash"
    "loglevel=3"
    "rd.systemd.show_status=false"
    "rd.udev.log_level=3"
    "systemd.show_status=auto"
  };

    boot.consoleLogLevel = 0;

    boot.loader.timeout = 1;

    boot.loader.grub.theme = pkgs.nixos-grub2-theme;

    boot.loader.grub.configurationLimit = 5;

    boot.initrd.systemd.enable = true;
}
