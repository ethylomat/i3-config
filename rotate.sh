#!/bin/bash

screen="LVDS1"

descr=$(xrandr | grep "$screen")
if echo "$descr" | grep disconnected
then
        echo "No $screen connected"
        exit 1
fi

alt="right"
if echo "$descr" | grep --quiet -P "^[^(]*$alt"
then
        rotate="normal"
else
        rotate="$alt"
fi
xrandr --output $screen --rotate $rotate 
