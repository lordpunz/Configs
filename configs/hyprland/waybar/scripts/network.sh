#!/bin/bash

# Ottieni lo stato corrente del WiFi
WIFI_STATE=$(nmcli radio wifi)

if [ "$WIFI_STATE" = "enabled" ]; then
    # Se il WiFi è attivo, mostra un menu per disconnettersi o selezionare una rete
    ACTION=$(echo -e "Disconnect\nSelect Network" | wofi --dmenu -p "WiFi")
    
    if [ "$ACTION" = "Disconnect" ]; then
        nmcli radio wifi off
        notify-send "WiFi" "Disconnected"
    elif [ "$ACTION" = "Select Network" ]; then
        SSID=$(nmcli device wifi list | tail -n +2 | wofi --dmenu -p "Select WiFi" | awk '{print $2}')
        if [ -n "$SSID" ]; then
            nmcli device wifi connect "$SSID"
            notify-send "WiFi" "Connected to $SSID"
        fi
    fi
else
    # Se il WiFi è disattivato, attivalo
    nmcli radio wifi on
    notify-send "WiFi" "Enabled"
fi
