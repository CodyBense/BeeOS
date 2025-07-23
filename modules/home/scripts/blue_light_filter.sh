#!/usr/bin/env bash

pkill hyprsunset

sleep 0.5

notify-send "Hyprsunset: Setting temp to 3000"
hyprsunset -t 3000 &
