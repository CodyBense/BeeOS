{ pkgs, ... }:

pkgs.writeShellScriptBin "blue_light_filter" ''
    #!/usr/bin/env bash

    pkill hyprsunset

    sleep 0.5

    temp=$1
    gama=$2

    if [[ -z "$gama" ]]; then
        notify-send "Hyprsunset: Setting temp to $temp"
        hyprsunset -t temp &
    else
        notify-send "Hyprsunset: Setting temp to $temp and gama to $gama"
        hyprsunset -t temp -g $gama &
    fi

''
