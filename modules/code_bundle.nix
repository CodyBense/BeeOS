{ lib, pkgs, ... }:
{
    imports = [
        ./code/python_module.nix
        ./code/rust_module.nix
    ];

    python_module.enable = lib.mkDefault true;
    rust_module.enable = lib.mkDefault true;

    environment.systemPackages = with pkgs; [
        gcc
    ];
}
