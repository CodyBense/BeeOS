{ pkgs, ... }:

{
    imports =
        [ # Include the results of the hardware scan.
            ./hardware-configuration.nix
            #../../modules/nix/audio.nix
            ../../modules/nix/boot.nix
            ../../modules/nix/code_bundle.nix
            ../../modules/nix/de.nix
            ../../modules/nix/fonts.nix
            ../../modules/nix/garbage.nix
            ../../modules/nix/hardware.nix
            ../../modules/nix/kanata.nix
            ../../modules/nix/networking.nix
            ../../modules/nix/packages.nix
            ../../modules/nix/samba.nix
            ../../modules/nix/services.nix
            # ../../modules/nix/stylix.nix
            ../../modules/nix/system.nix
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
        extraGroups = [ "networkmanager" "wheel" "audio" ];
        # extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [];
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    environment.sessionVariables = {
        NH_FLAKE = "/home/codybense/BeeOS";
    };

    environment.variables.EDITOR = "nvim";

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

    system.stateVersion = "25.05"; # Did you read the comment?
}
