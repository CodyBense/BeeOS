{
  description = "BeeOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
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
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self
    , nixpkgs
    , home-manager
    , nix-flatpak
    , nvf
    , ...
    } @ inputs:
    let
      system = "x86_64-linux";
      username = "codybense";
      overlays = [
      ];
    in
    {
      nixosConfigurations = {
        "Revan" = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit system;
            inherit inputs;
            inherit username;
          };
          modules = [
            ./hosts/Revan/configuration.nix
            inputs.stylix.nixosModules.stylix
            inputs.sops-nix.nixosModules.sops
            nix-flatpak.nixosModules.nix-flatpak
            nvf.nixosModules.default
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = {
                inherit inputs;
              };
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.users."codybense" = ./hosts/Revan/home.nix;
            }
          ];
        };
      };
      nixosConfigurations = {
        "Pikachu" = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit system;
            inherit inputs;
            inherit username;
          };
          modules = [
            ./hosts/Pikachu/configuration.nix
            inputs.sops-nix.nixosModules.sops
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.codybense = import ./hosts/Pikachu/home.nix;
                backupFileExtension = "backup";
              };
            }
          ];
        };
      };
    };
}
