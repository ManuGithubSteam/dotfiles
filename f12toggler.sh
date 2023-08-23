#!/bin/bash

SERVICE="alacritty"
if pgrep -x "$SERVICE" >/dev/null
then
    echo "$SERVICE is running"
    GETPID=$(ps aux | grep [a]lacritty | awk '{print $2}')
    GETWID=$(xdotool search --pid $GETPID)

    # check Toggle State
    FLAG=$(cat /tmp/ahide)
    if [ "$FLAG" == "shown" ]
    then
      echo "shown tree"
      xdotool windowunmap $GETWID
      echo hidden > /tmp/ahide
    else
       echo "hidden tree"
       xdotool windowmap $GETWID
       ERR=$?
       # Hide Icon
       xprop -id $GETWID -f _NET_WM_STATE 32a -set _NET_WM_STATE _NET_WM_STATE_SKIP_TASKBAR
       echo shown > /tmp/ahide
   fi

else
    echo "$SERVICE stopped"
    alacritty &
    echo shown > /tmp/ahide
fi


