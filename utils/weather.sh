#!/bin/bash

set -o pipefail
current_dir=$(dirname $0)
weather_file=$current_dir/weather.txt

weather_data=$(curl -s "wttr.in?format=j1")
current_temp=$(echo "$weather_data" | jq -r '.current_condition[0].temp_C')
current_location=$(echo "$weather_data" | jq -r '.nearest_area[0].areaName[0].value')
current_condition=$(echo "$weather_data" | jq -r '.current_condition[0].weatherDesc[0].value')

timestamp=$(date)

if [[ -z "$current_temp" || -z "$current_location" || -z "$current_condition" ]]; then
    echo "$timestamp: The weather service may be down." >> $weather_file
else
    echo "$timestamp: The weather in $current_location is $current_condition with a temperature of $current_temp°C" >> $weather_file
fi
