{ pkgs }:

pkgs.writeShellScriptBin "start-hyprland" ''
    #!/usr/bin/env bash

    pkill -q swww
    sleep 0.5
    swww-deamon &

    pkill -q waybar
    sleep 0.5
    waybar &

    nm-applet --indicator &

    pkill -q swaync
    sleep 0.5
    swaync &
''
