#!/bin/bash

playerctl metadata --player spotify --format '  {{duration(position)}}/{{duration(mpris:length)}}' 2>/dev/null
