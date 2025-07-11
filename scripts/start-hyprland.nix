{ pkgs }:

pkgs.writeShellScriptBin "start-hyprland" ''
    #!/usr/bin/env bash

    killall -9 swww-daemon
    sleep 0.5
    swww-daemon &

    swww img ~/BeeOS/wallpapers/cm-black-hole.png

    killall -9 .waybar-wrapped
    sleep 0.5
    waybar &

    nm-applet --indicator &

    killall -9 .swaync-wrapped
    sleep 0.5
    swaync &
''
