{ pkgs, inputs, ... }:

{
    environment.systemPackages = with pkgs; [
        arduino-cli
        arduino-ide
        bat
        brightnessctl
        btop
        cifs-utils
        cmake
        kdePackages.dolphin
        direnv
        dmenu
        docker-compose
        fastfetch
        firefox
        freecad-wayland
        fzf
        gcc
        gh
        ghostty
        git
        grimblast
        home-manager
        hyprcursor
        hypridle
        hyprlock
        hyprpanel
        hyprpicker
        hyprsunset
        rose-pine-hyprcursor
        kanata
        killall
        kitty
        lazygit
        libnotify
        localsend
        matugen
        neovim
        networkmanager
        networkmanagerapplet
        nh
        # orca-slicer
        pavucontrol
        power-profiles-daemon
        psmisc
        pyenv
        qmk
        inputs.quickshell.packages.${pkgs.system}.default
        ripgrep
        rofi-wayland
        rsync
        spotify
        starship
        swayimg
        swaynotificationcenter
        swww
        tlp
        tmux
        tree
        unzip
        vesktop
        vlc
        waybar
        wf-recorder
        wget
        wl-clipboard
        wlogout
        yazi
        zellij
        zoxide
    ];

    services.flatpak.packages = [
        "app.zen_browser.zen"
        "com.github.tchx84.Flatseal"
    ];
}
