#!/bin/bash
# Берём первую батарею
BAT=$(ls /sys/class/power_supply/ | grep -i "BAT\|BATT" | head -n1)

if [ -z "$BAT" ]; then
    echo '{"text":"No Battery"}'
    exit 0
fi

# Читаем процент и статус
CAP=$(cat /sys/class/power_supply/$BAT/capacity)
STAT=$(cat /sys/class/power_supply/$BAT/status)

# Выбираем иконку
if [ "$STAT" = "Charging" ]; then
    ICON=""
elif [ "$CAP" -ge 80 ]; then
    ICON=""
elif [ "$CAP" -ge 60 ]; then
    ICON=""
elif [ "$CAP" -ge 40 ]; then
    ICON=""
elif [ "$CAP" -ge 20 ]; then
    ICON=""
else
    ICON=""
fi

# Возвращаем JSON для Waybar
echo "{\"text\":\"$ICON $CAP%\",\"tooltip\":\"$CAP% - $STAT\"}"

