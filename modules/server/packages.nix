{ pkgs, inputs, ... }:

{
    programs.neovim = {
        enable = true;
        package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    };

    environment.systemPackages = with pkgs; [
        cargo
            direnv
            fzf
            gcc
            git
            github-cli
            lazygit
            nil
            rustc
            rustup
            starship
            tmux
            unzip
            yazi
            zoxide
    ]
}
