{ lib, ... }:
{
    programs.starship = {
        enable = true;
        enableBashIntegration = true;
        settings = {
            add_newline = false;
            format = lib.concatStrings [
                "$username$git_branch$character"
            ];
            scan_timeout = 10;
            username = {
                style_user = "white bold";
                style_root = "black bold";
                format = "[$user]($style) ";
                disabled = false;
                show_always = true;
            };
            character = {
                success_symbol = "->";
                error_symbol = "->";
            };
        };
    };
}
