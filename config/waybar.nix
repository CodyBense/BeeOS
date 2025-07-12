{ pkgs, ... }:
{
    programs.waybar = {
        enable = true;
        package = pkgs.waybar;
        settings = [
            {
                position = "top";
                spacing = 4;
                margin-top = 4;
                margin-left = 4;
                margin-right = 4;
                margin-bottom = 4;
                modules-left = [ "hyprland/workspaces" ];
                modules-center = [ "hyprland/window" ];
                modules-right = [ "pulseaudio" "network" "backlight" "battery" "power-profiles-daemon" ];

                "hyprland/workspaces" = {
                    disable-scroll = true;
                    all-outputs = true;
                    warp-on-scroll = false;
                };
            }
        ];
    };
}
