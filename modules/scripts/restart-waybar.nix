{ pkgs }:

pkgs.writeShellScriptBin "restart-waybar" ''
    #!/usr/bin/env bash

    # waybar ps id is .waybar-wrapped for some reason
    killall -9 .waybar-wrapped

    waybar &
''
