{ pkgs }:

pkgs.writeShellScriptBin "restart-waybar" ''
    #!/usr/bin/env bash

    pkill waybar

    sleep 0.5

    waybar &
''
