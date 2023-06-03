#!/bin/bash

current_dir=$(dirname $0)

source $current_dir/weather.sh

# Display custom message of the day
cat $current_dir/motd-message.txt

echo "🗓  Today is $(date +"%A, %B %d, %Y") it is $(date +"%r")"
echo "🌀 The current temperature is $current_temp"°" at "$current_location", the current condition is \""$current_condition"\"."
echo "--------------------------------------------------------------------------------------------"
# display a message from zen quotes
shuf -n 1 $current_dir/zenquotes.txt
echo "--------------------------------------------------------------------------------------------"