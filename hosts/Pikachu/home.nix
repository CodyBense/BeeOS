{ pkgs, username, ... }:

{
    home.username = "${username}";
    home.homeDirectory = "/home/${username}";
    # home.stateVersion = "25.11";
    home.stateVersion = "unstable";

    programs.home-manager.enable = true;
}
