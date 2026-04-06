#!/bin/bash

# Función para obtener el volumen actual
get_volume() {
    amixer get Master | grep -Po '[0-9]+(?=%)' | head -1
}

# Función para ver si está silenciado
is_mute() {
    amixer get Master | grep -Po '\[off\]' | head -1
}

# Acción según el argumento ($1)
case $1 in
    up)
        amixer set Master 5%+ > /dev/null
        ;;
    down)
        amixer set Master 5%- > /dev/null
        ;;
    mute)
        amixer set Master toggle > /dev/null
        ;;
esac

# Configuración de la notificación
VOLUME=$(get_volume)
MUTE=$(is_mute)

if [ "$MUTE" == "[off]" ]; then
    dunstify -i audio-volume-muted -t 1000 -r 2593 -u low "󰝟 Silenciado"
else
    # Barra de progreso visual en la notificación
    dunstify -i audio-volume-high -t 1000 -r 2593 -u low -h int:value:"$VOLUME" "Volumen: ${VOLUME}%"
fi
