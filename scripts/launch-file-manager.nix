{ pkgs, ... }:

pkgs.writeShellScriptBin "launch-file-manager" ''
    #!/usr/bin/env bash

    ghostty --title="file-manager" -e yazi
'';
