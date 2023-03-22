#!/bin/bash

# Check if a command is available
function command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install an application if it's not already installed
function install_app() {
    local app_name="$1"
    
    if ! command_exists "$app_name"; then
        echo "Installing $app_name..."
        # Replace this with the installation command for your OS
        brew install "$app_name"
    else
        echo "$app_name is already installed."
    fi
}

function install_cask_app() {
    local app_name="$1"
    
    if ! command_exists "$app_name"; then
        echo "Installing $app_name..."
        # Replace this with the installation command for your OS
        brew install --cask "$app_name"
    else
        echo "$app_name is already installed."
    fi
}

# Display a formatted message
function print_message() {
    local message="$1"
    local color="$2"
    
    case "$color" in
        green)  printf "\033[32m%s\033[0m\n" "$message" ;;
        red)    printf "\033[31m%s\033[0m\n" "$message" ;;
        blue)   printf "\033[34m%s\033[0m\n" "$message" ;;
        *)      printf "%s\n" "$message" ;;
    esac
}

# Read a configuration variable from a file
function read_config() {
    local config_file="$1"
    local config_var="$2"
    
    source "$config_file"
    echo "${!config_var}"
}

function close_apps() {
    osascript -e 'tell application "System Events" to set quitapps to name of every application process whose visible is true and name is not "Finder" and name is not "Terminal" and name is not "iTerm" and name is not "ChatGPT" and name is not "Electron"' -e 'repeat with closeall in quitapps' -e 'tell application closeall to quit' -e 'end repeat'
}
