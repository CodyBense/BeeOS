{ pkgs, ... }:

pkgs.writeShellScriptBin "blue_light_filter" ''
    #!/usr/bin/env bash
    hyprsunset -t 3000 &
''
