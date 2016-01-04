#!/bin/bash
mute=`amixer get Master | grep "Mono:" | awk '{print $6}'`
if [ $mute == "[on]" ]
then
    vol=`amixer get Master | grep "Mono:" | awk '{print $4}' | grep -oE "[[:digit:]]{1,}"`
    if [ $vol == "0" ]
    then
        echo "Mute"
    else
        echo $vol%
    fi
else
    echo "Mute"
fi