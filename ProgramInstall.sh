#!/bin/bash

echo "Welcome to Hexalellogram's Mac Setup Scripts."
read -n 1 -p "Do you want to proceed with running this script (see README.md for what it does), and is Xcode (or Xcode-beta) installed? (Y/n): " installAnswer && echo
if echo $installAnswer | grep -iq "^n"; then
    exit 1
else
    echo "You have chosen to proceed with running this script."
fi

echo "Gaining administrator privileges (these will be kept until the script is finished)"
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo -n "Making sure Xcode or Xcode-beta is installed..."
if [ -d /Applications/Xcode-beta.app ]; then
    echo "Xcode-beta.app detected!"
    sudo xcode-select -s /Applications/Xcode-beta.app # Set Xcode path to Xcode-beta
elif  [ -d /Applications/Xcode.app ]; then
    echo "Xcode.app detected!"
    sudo xcode-select -s /Applications/Xcode.app # Set Xcode path to Xcode
else
    echo "Xcode-beta or Xcode not found! Exiting..."
    exit 1
fi

echo "You have to accept the Xcode license. Keep pressing space until it prompts you to type accept."
sudo xcodebuild -license

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew update

echo "Installing all binaries and applications from Brewfile"
brew bundle # install all stuff from brew from Brewfile

# Cleanup
echo "Cleaning up"
brew cleanup

# Mackup
echo "Syncing program settings with Mackup"
cp .mackup.cfg ~/.mackup.cfg
mackup restore

# Set Startup Applications
echo "Setting Startup Applications"
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/TickTick.app", hidden:false, name:"TickTick"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Mail.app", hidden:false, name:"Mail"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Messages.app", hidden:false, name:"Messages"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Calendar.app", hidden:false, name:"Calendar"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/BetterTouchTool.app", hidden:false, name:"BetterTouchTool"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/NordVPN.app", hidden:false, name:"NordVPN"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Insync.app", hidden:false, name:"Insync"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Dropbox.app", hidden:false, name:"Dropbox"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Amphetamine.app", hidden:false, name:"Amphetamine"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/RescueTime.app", hidden:false, name:"RescueTime"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Telegram.app", hidden:false, name:"Telegram"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/MEGASync.app", hidden:false, name:"MEGASync"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Spotify.app", hidden:false, name:"Spotify"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Alfred 4.app", hidden:false, name:"Alfred 4"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/OneDrive.app", hidden:false, name:"OneDrive"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Macs Fan Control.app", hidden:false, name:"Macs Fan Control"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Messenger.app", hidden:false, name:"Messenger"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Discord.app", hidden:false, name:"Discord"}'
# osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Slack.app", hidden:false, name:"Slack"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Carbon Copy Cloner.app/Contents/Library/LoginItems/CCC User Agent.app", hidden:false, name:"CCC User Agent"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"~/Library/Application Support/Google/Android File Transfer/Android File Transfer Agent.app", hidden:false, name:"Android File Transfer Agent"}'

echo "Startup Applications Set!"

# Reset Launchpad to display Apple applications first in alphabetical order, then 3rd party applications on the following pages
defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock 

# Git pullall
cp git-pullall /usr/local/bin/git-pullall
chmod +x /usr/local/bin/git-pullall

# brew cask purge
cp brewcask-purge /usr/local/bin/brewcask-purge
chmod +x /usr/local/bin/brewcask-purge

# Finishing dialogs
echo "Installation of all programs complete!"
echo "The following apps must be installed manually:"
echo "  Google Chrome"
echo ""
echo "The following apps must be activated:"
echo "  Alfred 4"
echo "  Bartender"
echo "  Carbon Copy Cloner"
echo "  Tuxera NTFS"
echo "  VMware Fusion"

read -n 1 -p "Would you like to configure macOS System Settings? (Y/n): " settingsAnswer && echo
if echo $settingsAnswer | grep -iq "^n"; then
    echo "You have chosen not to configure system settings."
else
    chmod +x SystemSettings.sh
    ./SystemSettings.sh
fi
