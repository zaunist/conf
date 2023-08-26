#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

run "picom"
run "unclutter"
run "copyq"
run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
run "nm-applet"
run "batsignal"
run "sunshine"

killall -q polybar
polybar left &
polybar middle &
polybar right & 
polybar xwindow &


pkill xidlehook
xidlehook --detect-sleep --not-when-audio --not-when-fullscreen  --timer 600 'pkill cool-retro-term && systemctl suspend' ''

