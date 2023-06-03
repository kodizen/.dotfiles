#!/bin/bash
absolute_path=$(dirname $(realpath $0))

quotes_script=$absolute_path/utils/zenquotes.sh

(crontab -l 2>/dev/null; echo "0 9 * * * $quotes_script"; ) | crontab -
