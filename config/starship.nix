{ lib, ... }:
{
    programs.starship = {
        enable = true;
        enableBashIntegration = true;
        settings = {
            add_newline = false;
            format = lib.concatStrings [
                "$line_break"
                "$packagee"
                "$line_break"
                "$character"
            ];
            scan_timeout = 10;
            character = {
                sucess_symbol = "->";
                error_symbol = "->";
            };
        };
    };
}
