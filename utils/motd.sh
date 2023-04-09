#!/bin/bash

current_dir=$(dirname $0)

source $current_dir/weather.sh

# Display custom message of the day
cat $current_dir/motd-message.txt

echo "🗓  Today is $(date +"%A, %B %d, %Y") it is $(date +"%r")"
echo "🌀 The current temperature is $current_temp"°" at "$current_location", the current condition is \""$current_condition"\"."
echo "--------------------------------------------------------------------------------------------"
# display a message from zen quotes
curl -s https://zenquotes.io/api/random | jq -r '.[0].q + " -" + .[0].a'
echo "--------------------------------------------------------------------------------------------"