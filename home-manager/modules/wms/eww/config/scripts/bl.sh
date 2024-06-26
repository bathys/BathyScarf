#!/usr/bin/env bash

toggle() {
    STATUS="$(bluetoothctl show | grep Powered | awk '{print $2}')"
    if [ $STATUS == "yes" ]; then
        bluetoothctl power off
        notify-send --icon=bluetooth-offline --urgency=normal "Bluetooth" "Bluetooth has been turned off."
    else
        bluetoothctl power on
        notify-send --icon=volume-level-high --urgency=normal "Bluetooth" "Bluetooth has been turned on."
    fi
}

class() {
    # off
    if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
    then
        echo inactive
    else
        echo active
    fi
}

status() {
        # not connected
        if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]; then
                echo "Off"
        else
                # on
                if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]; then
                        echo "On"
                else
                        # get device alias
                        DEVICE=`echo info | bluetoothctl | grep 'Alias:' | awk -F:  '{ print $2 }'`
                        echo "$DEVICE"
                fi
        fi
}


if [[ $1 == "--status" ]]; then
        status
elif [[ $1 == "--icon" ]]; then
        icon
elif [[ $1 == "--toggle" ]]; then
        toggle
elif [[ $1 == "--class" ]]; then
    class
elif [[ $1 == "--battery" ]]; then
    battery
fi
