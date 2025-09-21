#!/bin/bash
# Увеличить громкость на 5%
pactl set-sink-volume @DEFAULT_SINK@ +5%
# Получить текущую громкость
VOL=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1)
# Показать OSD через wob
echo "$VOL" | wob -p 20 -a center

