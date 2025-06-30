{ pkgs, config, lib, host, ... }:
let
   betterTransisitons = "all 0.3s cubic-bezier(.55, -0.68, .48, 1.682)";
   inherit (import ../hosts/${host}/variables.nix} clock24h;
in
with lib;
{
    programs.waybar = {
        enable = true;
        package = pkgs.waybar;
        settings = [
            {
                layer = "top";
                position = "top";
                modules-left = [ "hyprland/workspaces" ];
                modules-center = [ "hyprland/window" ];
                modules-right = [ "network", "pulseaudio", "battery", "clock" ];
            };
        ];
    };
}
