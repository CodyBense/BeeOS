{
  description = "BeeOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # hyprland.url = "github:hyprwm/Hyprland";
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
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-flatpak,
    nvf,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    host = "Revan";
    username = "codybense";
    overlays = [
    ];
  in {
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
          nix-flatpak.nixosModules.nix-flatpak
          home-manager.nixosModules.home-manager
          nvf.nixosModules.default
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
            # home-manager.lib.homeManagerConfiguration = {
            #     pkgs = nixpkgs.legacyPackages.x86_64-linux;
            #     modules = [
            #         nvf.homeManagerModules.default
            #     ];
            # };
          }
        ];
      };
    };
  };
}
