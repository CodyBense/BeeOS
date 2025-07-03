{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        bat
        cmake
        direnv
        dmenu
        docker-compose
        fastfetch
        firefox
        fzf
        gcc
        gh
        ghostty
        hypridle
        hyprcursor
        rose-pine-hyprcursor
        lazygit
        libnotify
        neovim
        nh
        networkmanagerapplet
        pavucontrol
        pyenv
        ripgrep
        rofi-wayland
        spotify
        swayimg
        swaynotificationcenter
        starship
        tlp
        tmux
        tree
        unzip
        waybar
        wlogout
        yazi
        zoxide
        # inputs.zen-browser.packages."${system}".default

        # Hyprpanel
        wireplumber
        libgtop
        bluez
        bluez-tools
        networkmanager
        dart-sass
        wl-clipboard
        upower
        upower-notify
        gvfs

        brightnessctl
        power-profiles-daemon
        grimblast
        wf-recorder
        hyprpicker
        hyprsunset
        btop
        matugen
        swww
    ];
}
