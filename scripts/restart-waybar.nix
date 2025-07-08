{ pkgs }:

pkgs.writeShellScriptBin "restart-waybar" ''
    #!/usr/bin/env bash

    killall -9 waybar

    waybar &
''
