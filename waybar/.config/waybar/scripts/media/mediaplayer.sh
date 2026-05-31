#!/bin/bash

zscroll -l 20 --delay 0.3 --update-check true \
  "playerctl metadata --player spotify --format '{{artist}} - {{title}}'" 2>/dev/null

wait
