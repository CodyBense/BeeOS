{ pkgs, ... }:

{
    fonts.packages = with pkgs; [
        font-awesome
        jetbrains-mono
        cascadia-code
        maple-mono.NF
        mononoki
        noto-fonts-cjk-sans
        nerdfont.terminess-ttf
    ];
}
