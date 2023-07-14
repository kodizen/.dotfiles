#!/bin/bash

current_dir=$(dirname $0)

# zen quotes
echo -e "\e[90m☯️ $(shuf -n 1 $current_dir/zenquotes.txt)\e[0m"

# weather
# echo -e "\e[90m$(tail -n 1 $current_dir/weather.txt)\e[0m"

#  random oblique strategy
# echo -e "🧠 \e[90m$(shuf -n 1 $current_dir/oblique-strategies.txt)\e[0m"

