{ pkgs, ... }:

pkgs.writeShellScriptBin "rofi-notes" ''
    #!/usr/bin/env bash
    choice="$(printf "Pull\nPush" | rofi -dmenu)" || exit 0

    case $choice in 
        Pull) rsync -vr cody@192.168.1.243:/data/Notes $HOME/Documents/Notes;;
        Push) rsync -vr $HOME/Documents/Notes cody@192.168.1.243:/data;;
    esac
    
''
