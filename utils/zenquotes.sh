#!/bin/bash
current_dir=$(dirname $0)
quotes_file=$current_dir/zenquotes.txt

curl -s https://zenquotes.io/api/quotes | jq -r '.[] | .q + " -" + .a' >> $quotes_file

