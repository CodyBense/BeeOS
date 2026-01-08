{ pkgs, ... }:

pkgs.writeShellScriptBin "launch-nmtui" ''
    #!/usr/bin/env bash

    ghostty --title="nmtui" -e nmtui
''
