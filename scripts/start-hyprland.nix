{ pkgs }:

pkgs.writeShellScriptBin "start-hyprland" ''
    #!/usr/bin/env bash

    pkill -q swww-daemon
    sleep 0.5
    swww-deamon &

    swww img ~/BeeOS/wallpapers/cm-black-home.png

    pkill -q .waybar-wrapped
    sleep 0.5
    waybar &

    nm-applet --indicator &

    pkill -q .swaync-wrapped
    sleep 0.5
    swaync &
''
