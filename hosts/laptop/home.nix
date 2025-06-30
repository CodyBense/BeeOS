# dotfiles config control through home-manager
{ pkgs, username, inputs, ... }:

{
	# home-manager settings
	home.username = "${username}";
	home.homeDirectory = "/home/${username}";
	home.stateVersion = "25.11";

	# Import program configs
	## to be stored in ~/BeeOS/config/
	imports = [
        ../../config/hyprland.nix
        ../../config/wlogout.nix
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
    ];

    # uwsm
    wayland.windowManager.hyprland.systemd.enable = false;

	# let home-manager install and manage itself
	programs.home-manager.enable = true;
}
