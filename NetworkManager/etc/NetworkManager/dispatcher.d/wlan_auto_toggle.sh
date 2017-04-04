#!/bin/sh

if [ "" = "LAN_interface" ]; then
    case "" in
        up)
            nmcli radio wifi off
            ;;
        down)
            nmcli radio wifi on
            ;;
    esac
fi

