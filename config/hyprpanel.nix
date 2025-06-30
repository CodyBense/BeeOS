{ inputs, hyprpanel, ... }:
{
    imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];

    programs.hyprpanel = {
        enable = true;

        systemd.enable = true;

        hyprland.enable = true;

        overwrite.enable = true;

        theme = "catppuccin_mocha";

        layout = {
            "bar.layouts" = {
                "*" = {
                    left = [ "dashboard" "workspaces" "windowtitle" ];
                    middle = [ "media" ];
                    right = [ "volume" "network" "bluetooth" "battery" "systray" "clock" "notifications" ];
                };
            };
        };
    };
}
