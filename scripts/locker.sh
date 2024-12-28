#!/bin/sh

lock="swaylock"

swayidle -w \
  timeout 30 'if pgrep -x swaylock; then wlopm --off \*; fi' \
    resume 'wlopm --on \*' \
  timeout 300 $lock \
  timeout 330 'wlopm --off \*' \
    resume 'wlopm --on \*' \
  timeout 7200 'systemctl suspend' &
