#!/bin/bash

current_dir=$(dirname $0)

source $current_dir/weather.sh

# Set the list of websites
websites=(
  
)
# Display custom message of the day
cat $current_dir/motd-message.txt

echo "--------------------------------------------------------------------------------------------"
echo "🗓  Today is $(date +"%A, %B %d, %Y") it is $(date +"%r")"
echo "🌀 The current temperature is $current_temp"°" at "$current_location", the current condition is \""$current_condition"\"."


# check for brew updates
if [ -x "$(command -v brew)" ]
then
  updates=$(brew outdated | wc -l)
  if [ "$updates" -gt 0 ]
  then

echo "--------------------------------------------------------------------------------------------"

    echo "🍺 $updates brew updates are available. Run 'brew update && brew upgrade' to update."

echo "--------------------------------------------------------------------------------------------"
  fi
fi

# Check for system updates
if [ -x "$(command -v softwareupdate)" ]
then
  updates=$(softwareupdate -l | grep -c "recommended")
  if [ "$updates" -gt 0 ]
  then
  echo "--------------------------------------------------------------------------------------------"

    echo "🆕  $updates system updates are available."

    echo "--------------------------------------------------------------------------------------------"
  fi
fi
# Loop through the websites and check their status using curl
for website in "${websites[@]}"
do
  status_code=$(curl --silent --head --location --output /dev/null --write-out '%{http_code}' $website)

  # Display the service indicator based on the status code
  if [ $status_code -eq 200 ]
  then
    echo -e "\033[32m$website\033[0m is \033[32mUP\033[0m"

  else
    echo -e "\033[31m$website\033[0m is \033[31mDOWN\033[0m"

  fi
done


# Check any git repos for updates
if [ -x "$(command -v git)" ]
then
  for repo in $(find . -name .git -type d -prune)
  do
    cd $repo/..
    if [ -n "$(git status --porcelain)" ]
    then


      echo -e "\033[33m$(pwd)\033[0m has uncommitted changes."


    fi
  done
fi

# Check for any running docker containers
if [ -x "$(command -v docker)" ]
then
  containers=$(docker ps -a | wc -l)
  if [ "$containers" -gt 1 ]
  then


    echo "🐳  $containers docker containers are running."


  fi
fi

#  Check for any changes in git remotes, require a git pull
if [ -x "$(command -v git)" ]
then
  for repo in $(find . -name .git -type d -prune)
  do
    cd $repo/..
    if [ -n "$(git remote show origin | grep 'local out of date')" ]
    then
      echo "--------------------------------------------------------------------------------------------"

      echo -e "\033[33m$(pwd)\033[0m has changes in the remote."

      echo "--------------------------------------------------------------------------------------------"
    fi
  done
fi