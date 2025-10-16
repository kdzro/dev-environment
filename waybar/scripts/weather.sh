#!/usr/bin/env bash
for i in {1..5}
do
    ICON=$(curl -s "https://wttr.in/$1?format=%c&lang=en" | sed -E "s/\s+//g")
    
    TEXT_AND_TEMP=$(curl -s "https://wttr.in/$1?format=%C+%t&lang=en")
    
    if [[ $? == 0 ]]
    then
        TEXT_AND_TEMP=$(echo "$TEXT_AND_TEMP" | sed -E "s/\s+/ /g")
        
        case "$ICON" in
            "☀️")
                NF_ICON="󰖨"
                ;;
            "🌤️")
                NF_ICON=""
                ;;
            "⛅️")
                NF_ICON=""
                ;;
            "☁️")
                NF_ICON="☁"
                ;;
            "🌧️")
                NF_ICON=""
                ;;
            "⛈️")
                NF_ICON=""
                ;;
            "❄️")
                NF_ICON=""
                ;;
            "🌫️")
                NF_ICON=""
                ;;
            "🌡️")
                NF_ICON=""
                ;;
            *)
                NF_ICON="$ICON"
                ;;
        esac

        text="$NF_ICON $TEXT_AND_TEMP"
        
        tooltip=$(curl -s "https://wttr.in/$1?format=4&lang=en")
        if [[ $? == 0 ]]
        then
            tooltip=$(echo "$tooltip" | sed -E "s/\s+/ /g")
            echo "{\"text\":\"$text\", \"tooltip\":\"$tooltip\"}"
            exit
        fi
    fi
    sleep 2
done
echo "{\"text\":\"error\", \"tooltip\":\"error\"}"
