{ config, ... }:

{
    programs.zellij = {
        enable = true;
        enableBashIntegration = true;
        settings = {
            theme = "catppuccin-frappe";
            show_startup_tips = false;
        };
    };
}
