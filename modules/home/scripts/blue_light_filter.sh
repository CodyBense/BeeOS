#!/usr/bin/env bash

pkill hyprsunset

sleep 0.5

notify-send "Hyprsunset: Setting temp to $temp"
hyprsunset -t 3000 &
