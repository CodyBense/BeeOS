{ pkgs, ... }:

{
    imports =
        [ # Include the results of the hardware scan.
            ./hardware-configuration.nix
            ../../modules/nix/audio.nix
            ../../modules/nix/boot.nix
            ../../modules/nix/code_bundle.nix
            ../../modules/nix/de.nix
            ../../modules/nix/fonts.nix
            ../../modules/nix/garbage.nix
            ../../modules/nix/hardware.nix
            ../../modules/nix/kanata.nix
            ../../modules/nix/networking.nix
            ../../modules/nix/nvf.nix
            ../../modules/nix/packages.nix
            ../../modules/nix/samba.nix
            # ../../modules/nix/stylix.nix
            # ../../modules/nix/systemd.nix
        ];

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

    # # Enable cachix for Hyprland
    # nix.settings = {
    #     substituters = ["https://hyprland.cachix.org"];
    #     trusted-substituters = ["https://hyprland.cachix.org"];
    #     trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    # };   
    #
    # # Enables Hyprland
    # programs.hyprland = {
    #     enable = true;
    #     # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    #     # portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    #     withUWSM = true;
    # };
    #
    # # Enables Sway
    # programs.sway = {
    #     enable = true;
    #     wrapperFeatures.gtk = true;
    # };
    #
    # # starts Hyprland
    # programs.uwsm.enable = true;
    # programs.uwsm.waylandCompositors = {
    #     hyprland = {
    #         prettyName = "Hyprland";
    #         comment = "Hyprland compositor managed by UWSM";
    #         binPath = "/run/current-system/sw/bin/Hyprland";
    #     };
    # };


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

    # Tailscale
    services.tailscale.enable = true;

    system.stateVersion = "25.05"; # Did you read the comment?
}
