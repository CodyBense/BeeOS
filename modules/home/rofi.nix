{ pkgs, config, ... }:

{
    programs = {
        rofi = {
            enable = true;
            package = pkgs.rofi-wayland;
            modes = [
                "drun"
            ];
            location = "center";
            font = "JetBrainsMono Nerd Font Mono 12";

            theme =
            let
                inherit (config.lib.formats.rasi) mkLiteral;
            in
            {
                "*" = {
                    rosewater = mkLiteral "#f5e0dc";
                    flamingo = mkLiteral "#f2cdcd";
                    pink = mkLiteral "#f5c2e7";
                    mauve = mkLiteral "#cba6f7";
                    red = mkLiteral "#f38ba8";
                    maroon = mkLiteral "#eba0ac";
                    peach = mkLiteral "#fab387";
                    yellow = mkLiteral "#f9e2af";
                    green = mkLiteral "#a6e3a1";
                    teal = mkLiteral "#94e2d5";
                    sky = mkLiteral "#89dceb";
                    sapphire = mkLiteral "#74c7ec";
                    blue = mkLiteral "#89b4fa";
                    lavender = mkLiteral "#b4befe";
                    text = mkLiteral "#cdd6f4";
                    subtext1 = mkLiteral "#bac2de";
                    subtext0 = mkLiteral "#a6adc8";
                    overlay2 = mkLiteral "#9399b2";
                    overlay1 = mkLiteral "#7f849c";
                    overlay0 = mkLiteral "#6c7086";
                    surface2 = mkLiteral "#585b70";
                    surface1 = mkLiteral "#45475a";
                    surface0 = mkLiteral "#313244";
                    base = mkLiteral "#1e1e2e";
                    mantle = mkLiteral "#181825";
                    crust = mkLiteral "#11111b";
                };

                "window" = {
                    width = mkLiteral "50%";
                    transparency = "real";
                    orientation = mkLiteral "vertical";
                    cursor = mkLiteral "default";
                    spacing = mkLiteral "0px";
                    border = mkLiteral "2px";
                    background-color = "@overlay1";
                    border-color = "@yellow";
                    border-radius = mkLiteral "20px";
                };

                "mainbox" = {
                    padding = mkLiteral "15px";
                    enabled = true;
                    orientation = mkLiteral "vertical";
                    children = map mkLiteral [
                        "inputbar"
                        "listbox"
                    ];
                    background-color = mkLiteral "transparent";
                };

                "inputbar" = {
                    enabled = true;
                    padding = mkLiteral "10px 10px 10px 10px";
                    margin = mkLiteral "10px";
                    background-color = "@overlay1";
                    border-radius = mkLiteral "25px";
                    orientation = mkLiteral "horizontal";
                    children = map mkLiteral [
                        "entry"
                        "dummy"
                        "mode-switcher"
                    ];
                };

                "entry" = {
                    enabled = true;
                    expand = true;
                    width = mkLiteral "20%";
                    padding = mkLiteral "10px";
                    border-radius = mkLiteral "12px";
                    cursor = mkLiteral "text";
                };

                "listbox" = {
                    spacing = mkLiteral "10px";
                    padding = mkLiteral "10px";
                    border-radius = mkLiteral "25px";
                    background-color = "@maroon";
                    orientation = mkLiteral "vertical";
                    children = map mkLiteral [
                        "message"
                        "listview"
                    ];
                };

                "listview" = {
                    enabled = true;
                    columns = 2;
                    lines = 6;
                    cycle = true;
                    dynamic = true;
                    scrollbar = false;
                    layout = mkLiteral "vertical";
                    reverse = false;
                    fixed-height = false;
                    fixed-columns = true;
                    spacing = mkLiteral "10px";
                    background-color = mkLiteral "transparent";
                    border = mkLiteral "10px";
                };

                "dummy" = {
                    expand = true;
                    background-color = mkLiteral "transparent";
                };

                "button" = {
                    width = mkLiteral "5%";
                    padding = mkLiteral "12px";
                    border-radius = mkLiteral "12px";
                    cursor = mkLiteral "pointer";
                };

                "button selected" = {
                };

                "scrollbar" = {
                    width = mkLiteral "4px";
                    border = mkLiteral "0";
                    handle-color = "@base";
                    handle-width = mkLiteral "8px";
                    padding = mkLiteral "0";
                };

                "element" = {
                    enabled = true;
                    spacing = mkLiteral "10px";
                    padding = mkLiteral "10px";
                    border-radius = mkLiteral "12px";
                    background-color = mkLiteral "transparent";
                    cursor = mkLiteral "pointer";
                };

                "element normal.normal" = {
                    background-color = mkLiteral "inherit";
                    text-color = mkLiteral "inherit";
                };

                "element normal.urgent" = {
                        text-color = "@pink";
                };

                "element normal.active" = {
                    text-color = "@yellow";
                };

                "element selected.normal" = {
                };

                "element selected.urgent" = {
                };

                "element selected.active" = {
                };

                "element alternate.normal" = {
                    background-color = mkLiteral "transparent";
                    text-color = mkLiteral "inherit";
                };

                "element alternate.urgent" = {
                    background-color = mkLiteral "transparent";
                    text-color = mkLiteral "inherit";
                };

                "element alternate.active" = {
                    background-color = mkLiteral "transparent";
                    text-color = mkLiteral "inherit";
                };

                "element-icon" = {
                    background-color = mkLiteral "transparent";
                    text-color = mkLiteral "inherit";
                    size = mkLiteral "36px";
                    cursor = mkLiteral "inherit";
                };

                "element-text" = {
                    background-color = mkLiteral "transparent";
                    font = "JetBrainsMono Nerd Font Mono 12";
                    text-color = "@crust";
                    cursor = mkLiteral "inherit";
                    vertical-align = mkLiteral "0.5";
                    horizontal-align = mkLiteral "0.0";
                };

                "message" = {
                    background-color = mkLiteral "transparent";
                    border = mkLiteral "0px";
                };

                "textbox" = {
                    padding = mkLiteral "12px";
                    border-radius = mkLiteral "10px";
                    vertical-align = mkLiteral "0.5";
                    horizontal-align = mkLiteral "0.0";
                };

                "error-message" = {
                    padding = mkLiteral "12px";
                    border-radius = mkLiteral "20px";
                };
                
            };
        };
    };
}
