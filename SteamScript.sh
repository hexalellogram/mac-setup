#!/bin/bash

echo "Please DO NOT close this Terminal window!"
osascript -e 'quit app "Steam"'
read -p "Please ensure Steam has quit (force quit if needed), sometimes Steam is wonky and won't quit. (Press Enter to continue)"
read -p "Enter Steam Username: " username
read -s -p "Enter Steam Password: " password; echo
echo "You will need to enter your Steam Guard code for the first time soon so have your phone ready."
echo "This should be a one-time only occurrence since after this Steam will use cached credentials."

echo "Installing Team Fortress 2"
steamcmd +login $username $password +app_update 440 validate

echo "Installing Kerbal Space Program"
steamcmd +login $username $password +app_update 220200 validate

echo "Installing Planetary Annihilation"
steamcmd +login $username $password +app_update 232250 validate

echo "Installing Civilization V + DLC"
steamcmd +login $username $password +app_update 8930 validate # DLC is included with this

echo "Steam Games Installed! You may now close this Terminal window"
