# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/nix/packages.nix
      ../../modules/nix/code_bundle.nix
      ../../modules/nix/systemd.nix
      ../../modules/nix/systemd.nix
      ../../modules/nix/fonts.nix
      ../../modules/nix/kanata.nix
      ../../modules/nix/samba.nix
      ../../modules/home/nvf.nix
      # ../../modules/nix/stylix.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "laptop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable bluetooth
  hardware.bluetooth.enable = true;

  hardware.enableAllFirmware = true;

  # Enable Pipewire
  security.rtkit.enable = true;
  services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      extraConfig.pipewire."92-low-latency" = {
          "context.properties" = {
              "default.clock.rate" = 48000;
              "default.clock.quantum" = 256;
              "default.clock.min-quantum" = 256;
              "default.clock.max-quantum" = 256;
          };
      };
      extraConfig.pipewire-pulse."92-low-latency" = {
          context.modules = [
            {
                name = "libpipewire-module-protocol-pulse";
                args = {
                  pulse.min.req = "256/48000";
                  pulse.default.req = "256/48000";
                  pulse.max.req = "256/48000";
                  pulse.min.quantum = "256/48000";
                  pulse.max.quantum = "256/48000";
                };
            }
          ];
      };
  };
  
  # Enable qmk
  hardware.keyboard.qmk.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.codybense = {
    isNormalUser = true;
    description = "codybense";
    extraGroups = [ "networkmanager" "wheel" "audio"];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.sessionVariables = {
      NH_FLAKE = "/home/codybense/BeeOS";
  };

  environment.variables.EDITOR = "nvim";

  # Enables nix flakes

  # Garbage collection
  nix = {
      settings = {
          auto-optimise-store = true;
          experimental-features = [ "nix-command" "flakes" ];
      };
      gc = {
          automatic = true;
          dates = "weekly";
          options = "--delete-older-than 7d";
      };
  };

  # Enables Hyprland
  programs.hyprland = {
      enable = true;
      withUWSM = true;
  };

  # Enables Sway
  programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
  };

# starts Hyprland
  programs.uwsm.enable = true;
  programs.uwsm.waylandCompositors = {
      hyprland = {
          prettyName = "Hyprland";
          comment = "Hyprland compositor managed by UWSM";
          binPath = "/run/current-system/sw/bin/Hyprland";
      };
  };


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Flatpak
  services.flatpak.enable = true;
  services.flatpak.update.onActivation = true;
  # services.flatpak.update.auto = {
  #     enable = true;
  #     onCalendar = "weekly";
  # };

  # Power-profiles-daemon
  services.power-profiles-daemon.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).

  system.stateVersion = "25.05"; # Did you read the comment?

}
