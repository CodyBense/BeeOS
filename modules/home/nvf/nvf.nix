{ pkgs, lib, ... }:

{
    imports = [
        ./nvf-keymaps.nix
        ./nvf-plugins.nix
        ./nvf-options.nix
    ];
    programs.nvf = {
        enable = true;
        settings = {
            vim = {
                theme = {
                    enable = true;
                    name = "catppuccin";
                    style = "mocha";
                    transparent = true;
                };
                statusline.lualine.enable = true;
                autocomplete.nvim-cmp.enable = true;

                languages = {
                    enableLSP = true;
                    enableTreesitter = true;

                    nix.enable = true;
                };
            };
        };
    };
}
