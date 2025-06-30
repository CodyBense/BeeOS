{ pkgs }:

pkgs.writeShellScriptBin "start-hyprland" ''
    #!/usr/bin/env bash

    pkillall -q swww
    sleep 0.5
    swww-deamon &

    pkillall -q waybar
    sleep 0.5
    waybar &

    nm-applet --indicator &

    pkillall -q swaync
    sleep 0.5
    swaync &
''
