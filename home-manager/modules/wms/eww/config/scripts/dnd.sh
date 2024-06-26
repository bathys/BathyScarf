#!/usr/bin/env bash

STATUS=$(dunstctl is-paused)

toggle() {
    if [ $STATUS == "false" ]; then
        dunstctl set-paused true
    else
        dunstctl set-paused false
    fi
}


class() {
    if [ $STATUS == "false" ]; then
        echo inactive
    else
        echo active
    fi
}

if [[ $1 == "--toggle" ]]; then
    toggle
elif [[ $1 == "--class" ]]; then
    class
fi
