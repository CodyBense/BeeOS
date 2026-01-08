{ pkgs }:

pkgs.writeShellScriptBin "exc" ''
    #!/usr/bin/env bash

    chmod u+x $PWD/$1
''
