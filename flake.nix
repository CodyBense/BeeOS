{
	description = "BeeOS Flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
        hyprpanel = {
            url = "github:Jas-SinghFSU/HyprPanel";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        stylix = {
            url = "github:danth/stylix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        sops-nix = {
            url = "github:Mic92/sops-nix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
	};

	outputs = { self, nixpkgs, home-manager, hyprpanel, ... }@inputs:
	let
		system = "x86_64-linux";
		host = "laptop";
		username = "codybense";
        overlays = [
            inputs.hyprpanel.overlay
        ];
	in
	{
		nixosConfigurations = {
			${host} = nixpkgs.lib.nixosSystem {
				specialArgs = {
					inherit system;
					inherit inputs;
					inherit username;
					inherit host;
				};
				modules = [
					./hosts/${host}/configuration.nix
                    inputs.stylix.nixosModules.stylix
                    inputs.sops-nix.nixosModules.sops
                    home-manager.nixosModules.home-manager
						{
							home-manager.extraSpecialArgs = {
								inherit inputs;
								inherit username;
								inherit host;
							};
							home-manager.useGlobalPkgs = true;
							home-manager.useUserPackages = true;
							home-manager.backupFileExtension = "backup";
							home-manager.users.${username} = ./hosts/${host}/home.nix;
						}
                        { nixpkgs.overlays = [ inputs.hyprpanel.overlay ]; }
				];
			};
		};
	};
}
