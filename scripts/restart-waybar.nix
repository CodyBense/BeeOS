{ pkgs }:

pkgs.writeShellScriptBin "restart-waybar" ''
    #!/usr/bin/env bash

    pkill waybar

    waybar &
''
