#!/bin/bash

echo "welcome to Hexalellogram's Mac Setup Scripts."
read -n 1 -p "Do you want to proceed with running this script (see README.md for what it does), and is Xcode (or Xcode-beta) installed? (Y/n): " installAnswer && echo
if echo $installAnswer | grep -iq "^n"; then
    exit 1
else
    echo "You have chosen to proceed with running this script."
fi

echo "Making my Temp folder"
mkdir ~/Temp

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

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

# Install command line tools from brew
echo "Installing command line apps"
brew install mas
brew install wget
brew install tree
brew install m-cli
brew install archey
brew install hub
brew install trash

# Enable cask-versions
brew tap caskroom/verisons

# Install apps from brew cask

# Core/Essential Apps
echo "Installing Core/Essential Apps"
brew cask install 1password-beta # highest priority since I need my passwords
brew cask install steam # high priority so I can begin downloading games
echo "Beginning Installation of Steam Games in Background (do not close the new window)"
chmod + x SteamScript.sh
osascript -e 'tell app "Terminal" to do script "cd $PWD && ./SteamScript.sh"'
# sh /Applications/Steam.app/Contents/MacOS/steam.sh >/dev/null 2>&1 &
# echo "We just installed Steam so please log into Steam and begin downloading your games now, thanks."
brew cask install google-chrome-beta
brew cask install insync
brew cask install bettertouchtool

echo "Configuring BTT Window Management KB Shortcuts"
cd BTTFiles
cp btt_data_store.v2 ~/Library/Application\ Support/BetterTouchTool/
cp btt_data_store.v2-shm ~/Library/Application\ Support/BetterTouchTool/
cp btt_data_store.v2-wal ~/Library/Application\ Support/BetterTouchTool/
cd -
echo "BTT Window Management KB Shortcuts Configured! See the repository wiki for details about what these keyboard shortcuts are and what they do!"

brew cask install carbon-copy-cloner
brew cask install spotify
brew cask install microsoft-office
brew cask install vmware-fusion
brew cask install yakyak
echo "Core/Essential Apps installed!"

# Menubar Apps
echo "Installing Menubar Apps"
brew cask install dropbox
# brew cask install google-drive    # removed for now because google-drive has been replaced with google-backup-and-sync BUT 
                                    # that is a client for personal accounts, I use google-drive for a G Suite account so I 
                                    # am still waiting on Google to release Drive File Stream which is the new G Suite app
                                    # which will replace Google Drive for G Suite accounts. Remember to change the Google 
                                    # Drive login item below as well when Drive File Stream arrives
brew cask install onedrive
brew cask install nordvpn
brew cask install semulov
brew cask install spotify-notifications
brew cask install yujitach-menumeters
chmod +x BrightnessMenulet.sh
./BrightnessMenulet.sh
brew cask install rescuetime
brew cask install itsycal
echo "Menubar Apps Installed!"

# Objective-See Security Apps
echo "Installing Objective-See Security Apps"
brew cask install blockblock
brew cask install oversight
brew cask install ransomwhere
brew cask install whatsyoursign
echo "Objective-See Security Apps Installed"

# Code/Computer Science
echo "Installing Code/Computer Science Apps"
brew cask install gitkraken
brew cask install java
brew cask install eclipse-java
brew cask install visual-studio-code
brew cask install powershell
echo "Code/Computer Science Apps Installed!"

# Other Apps/Utilities
echo "Installing Other Apps/Utilities"
brew cask install adobe-acrobat-reader
brew cask install android-file-transfer
brew cask install appcleaner
brew cask install the-unarchiver
brew cask install keka
brew cask install tuxera-ntfs
brew cask install osxfuse
brew cask install android-platform-tools
brew cask install transmission
brew cask install makemkv
brew cask install handbrake
brew cask install metaz
brew cask install silverlight
brew cask install ngrok
echo "Other Apps/Utilities Installed!"

# Install quick look generators
echo "Installing Finder Quick Look Generators"
brew cask install betterzipql 
brew cask install qlcolorcode 
brew cask install qlmarkdown 
brew cask install qlstephen
echo "Finder Quick Look Generators Installed!"

# install brew-cask-upgrade
brew tap buo/cask-upgrade
brew cask install brew-cask-upgrade

# Install apps from Mac App Store
echo "Installing Mac App Store Apps"
mas install 937984704 # Amphetamine
mas install 409201541 # Pages
mas install 409183694 # Keynote
mas install 409203825 # Numbers
echo "Mac App Store Apps Installed!"

# Cleanup
echo "Cleaning up"
brew prune
brew cleanup

# Install Touch ID PAM Module
read -n 1 -p "Do you want to install the Touch ID PAM Module? (Y/n) (HIGHLY EXPERIMENTAL): " pamAnswer && echo
if echo $pamAnswer | grep -iq "^n"; then
    chmod +x TouchIDPAM.sh
    ./TouchIDPAM.sh
else
    echo "You have chosen to bypass the installation of the Touch ID PAM Modue."
fi

# Set Startup Applications
echo "Setting Startup Applications"
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Reminders.app", hidden:false, name:"Reminders"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Mail.app", hidden:false, name:"Mail"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Messages.app", hidden:false, name:"Messages"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Spotify.app", hidden:false, name:"Spotify"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Steam.app", hidden:false, name:"Steam"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/BetterTouchTool.app", hidden:false, name:"BetterTouchTool"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Spotify Notifications.app", hidden:false, name:"Spotify Notifications"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/NordVPN.app", hidden:false, name:"NordVPN"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/OverSight.app/Contents/Library/LoginItems/OverSight Helper.app", hidden:false, name:"OverSight Helper"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"~/Library/Application Support/Google/Android File Transfer/Android File Transfer Agent.app", hidden:false, name:"Android File Transfer Agent"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Insync.app", hidden:false, name:"Insync"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Google Drive.app", hidden:false, name:"Google Drive"}' # remove when Google Drive is replaced with Drive File Stream
osascript -e 'tell application "System Events" to make login item at end with properties {path:"~/Library/PreferencePanes/MenuMeters.prefPane/Contents/Resources/MenuMetersApp.app", hidden:false, name:"MenuMetersApp"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Semulov.app", hidden:false, name:"Semulov"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Carbon Copy Cloner.app/Contents/Library/LoginItems/CCC User Agent.app", hidden:false, name:"CCC User Agent"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Dropbox.app", hidden:false, name:"Dropbox"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Amphetamine.app", hidden:false, name:"Amphetamine"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Yakyak.app", hidden:false, name:"Yakyak"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Itsycal.app", hidden:false, name:"Itsycal"}'
echo "Startup Applications Set!"

# Finishing dialogs
echo "Installation of all programs complete!"
echo "The following apps must be installed manually:"
echo "  Winclone"
echo ""
echo "The following apps must be activated:"
echo "  Winclone (not installed automatically)"
echo "  Carbon Copy Cloner"
echo "  Tuxera NTFS"
echo "  VMware Fusion"

read -n 1 -p "Would you like to configure macOS System Settings? (Y/n): " settingsAnswer && echo
if echo $installAnswer | grep -iq "^n"; then
    echo "You have chosen not to configure system settings."
else
    chmod +x SystemSettings.sh
    ./SystemSettings.sh
fi
