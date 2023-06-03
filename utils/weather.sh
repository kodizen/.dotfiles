#!/bin/bash

set -o pipefail

weather_data=$(curl -s "wttr.in?format=j1")
current_temp=$(echo "$weather_data" | jq -r '.current_condition[0].temp_C')
current_location=$(echo "$weather_data" | jq -r '.nearest_area[0].areaName[0].value')
current_condition=$(echo "$weather_data" | jq -r '.current_condition[0].weatherDesc[0].value')
