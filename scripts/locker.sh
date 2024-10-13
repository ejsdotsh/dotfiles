#!/bin/sh

lock="swaylock"

swayidle -w \
  timeout 10 'if pgrep -x swaylock; then wlopm --off \*; fi' \
    resume 'wlopm --on \*' \
  timeout 300 $lock \
  timeout 305 'wlopm --off \*' \
    resume 'wlopm --on \*' \
  timeout 3600 'systemctl suspend' &
