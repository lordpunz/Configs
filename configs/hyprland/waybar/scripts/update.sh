#!/bin/bash

# Se il sistema operativo non è Arch Linux, esci dallo script con successo
if [ ! -f /etc/arch-release ]; then
    exit 0
fi

# Calcola gli aggiornamenti per ogni servizio
AUR=$(yay -Qua | wc -l)
OFFICIAL=$(checkupdates | wc -l)

# Case/switch per gli aggiornamenti di ogni servizio
case $1 in
    aur)
        echo " $AUR"
        ;;
    official)
        echo " $OFFICIAL"
        ;;
esac

# Se il parametro è "update", aggiorna tutti i servizi
if [ "$1" = "update" ]; then
    kitty --title update-sys sh -c 'yay -Syu'
fi

# Se non ci sono parametri, restituisci il numero totale di aggiornamenti
if [ "$1" = "" ]; then
    # Calcola il numero totale di aggiornamenti
    COUNT=$((OFFICIAL+AUR))
    
    # Se ci sono aggiornamenti, lo script produrrà il seguente output:  Updates
    # Se non ci sono aggiornamenti, lo script non produrrà alcun output.
    if [[ "$COUNT" = "0" ]]; then
        echo ""
    else
        # Questo simbolo di Update è RTL. Quindi ‭ è l'override da sinistra a destra.
        echo " $COUNT"
    fi
    exit 0
fi
