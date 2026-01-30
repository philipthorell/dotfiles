#!/bin/bash
count=$(checkupdates 2>/dev/null | wc -l)
echo "${count:-0}" > /tmp/pacman-updates
