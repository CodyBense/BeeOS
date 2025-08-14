{ ... }: 

{
    # Enable cachix for Hyprland
    nix.settings = {
        # substituters = ["https://hyprland.cachix.org"];
        # trusted-substituters = ["https://hyprland.cachix.org"];
        # trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };
    # Enables Hyprland
    programs.hyprland = {
        enable = true;
        # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        # portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
        withUWSM = true;
    };

    # Starts Hyprland
    programs.uwsm.enable = true;
    programs.uwsm.waylandCompositors = {
        hyprland = {
            prettyName = "Hyprland";
            comment = "Hyprland compositor managed by UWSM";
            binPath = "/run/current-system/sw/bin/Hyprland";
        };
    };

    # Enables Sway
    programs.sway = {
        enable = true;
        wrapperFeatures.gtk = true;
    };
}
