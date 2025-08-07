# dotfiles config control through home-manager
{ pkgs, username, lib, inputs, ... }:

{
	# home-manager settings
	home.username = "${username}";
	home.homeDirectory = "/home/${username}";
	home.stateVersion = "25.11";

	# Import program configs
	imports = [
        ../../modules/home/hypr/hyprland.nix
        ../../modules/home/hypr/hyprlock.nix
        ../../modules/home/wlogout.nix
        ../../modules/home/bash.nix
        ../../modules/home/rofi.nix
        ../../modules/home/zellij.nix
        ../../modules/home/waybar.nix
        ../../modules/home/obsidian.nix
        # ../../modules/home/nvf.nix
        # ../../modules/home/starship.nix
        # ../../modules/home/hyprpanel.nix

        ../../modules/home/home_bundle.nix
	];

	# place files in home dir
	## home.file."</desired/path>" = { source = </path/>; recursive; };

    # Scripts
    home.packages = [
        (import ../../modules/home/scripts/hyprland-monitor-toggle.nix {inherit pkgs;})
        (import ../../modules/home/scripts/start-hyprland.nix {inherit pkgs;})
        (import ../../modules/home/scripts/exc.nix {inherit pkgs;})
        (import ../../modules/home/scripts/rofi-launch.nix {inherit pkgs;})
        (import ../../modules/home/scripts/restart-waybar.nix {inherit pkgs;})
        (import ../../modules/home/scripts/blue_light_filter.nix {inherit pkgs;})
        (import ../../modules/home/scripts/launch-file-manager.nix {inherit pkgs;})
        (import ../../modules/home/scripts/launch-nmtui.nix {inherit pkgs;})
    ];

    # uwsm
    wayland.windowManager.hyprland.systemd.enable = false;

	# let home-manager install and manage itself
	programs.home-manager.enable = true;
}
