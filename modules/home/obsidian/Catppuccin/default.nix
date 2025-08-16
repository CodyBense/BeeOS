{ pkgs }:

pkgs.stdenv.mkDerivation rec {
    pname = "catppuccin-obsidian";
    version = "2.0.3";

    src = pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "obsidian";
        rev = version;
        sha256 = "sha256-9fSFj9Tzc2aN9zpG5CyDMngVcwYEppf7MF1ZPUWFyz4=";
    };

    phases = [ "installPhase" ];

    installPhase = ''
        mkdir -p $out
        cp $src/theme.css $out
        cp $src/manifest/json $out
        ln -s $out/theme.css $out/obsidian.css
    '';
}
