# dotfiles config control through home-manager
{ pkgs, username, lib, inputs, ... }:

{
	# home-manager settings
	home.username = "${username}";
	home.homeDirectory = "/home/${username}";
	home.stateVersion = "25.11";

	# Import program configs
	## to be stored in ~/BeeOS/config/
	imports = [
        ../../modules/hyprland/hyprland_module.nix
        ../../config/wlogout.nix
        ../../config/bash.nix
        ../../config/rofi.nix
        ../../config/zellij.nix
        ../../config/waybar.nix
        # ../../config/starship.nix
        # ../../config/hyprpanel.nix

        ../../modules/home_bundle.nix
	];

	# place files in home dir
	## home.file."</desired/path>" = { source = </path/>; recursive; };

	# scripts
	## check old flake for this

    # Scripts
    home.packages = [
        (import ../../scripts/hyprland-monitor-toggle.nix {inherit pkgs;})
        (import ../../scripts/start-hyprland.nix {inherit pkgs;})
        (import ../../scripts/exc.nix {inherit pkgs;})
        (import ../../scripts/rofi-launch.nix {inherit pkgs;})
        (import ../../scripts/restart-waybar.nix {inherit pkgs;})
        (import ../../scripts/blue_light_filter.nix {inherit pkgs;})
        (import ../../scripts/launch-file-manager.nix {inherit pkgs;})
    ];

    # uwsm
    wayland.windowManager.hyprland.systemd.enable = false;

	# let home-manager install and manage itself
	programs.home-manager.enable = true;
}
