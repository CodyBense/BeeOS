{ lib, pkgs, ... }:
{
    programs.git = {
        enable = true;
        package = pkgs.git;
        userName = "CodyBense";
        userEmail = "codybense@gmail.com";
        extraConfig.init.defaultBranch = "main";
    };

    programs.gh = {
        enable = true;
        package = pkgs.gh;
        settings.git_protocol = "ssh";
    };

    programs.fzf = {
        enable = true;
        package = pkgs.fzf;
        enableBashIntegration = true;
    };

    programs.direnv = {
        enable = true;
        package = pkgs.direnv;
        enableBashIntegration = true;
    };
}
