#!/usr/bin/env bash

choice="$(printf "Pull (p)\nPush (P)" | rofi -dmenu)" || exit 0

case $choice in 
    p) rsync -vr cody@192.168.1.243:/data/Notes $HOME/Documents;;
    P) rsync -vr $HOME/Documents/Notes cody@192.168.1.243:/data;;
esac
