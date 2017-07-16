#!/bin/bash

echo "Do you want to proceed with installation of Homebrew and all programs, and is Xcode (or Xcode-beta) installed? (Y/n): "
read -n installAnswer
if echo "$installAnswer" | grep -iq "^n"; then
    exit 1
else
    echo "You have chosen to proceed with application installation."
fi

echo -n "Making sure Xcode-beta is installed..."
if [ -d /Applications/Xcode-beta.app ]; then
    echo "Xcode-beta.app detected!"
    xsudo code-select -s /Applications/Xcode-beta.app # Set Xcode path to Xcode-beta
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

# Enable cask-versions
brew tap caskroom/verisons

# Install apps from brew cask

# Core/Essential Apps
echo "Installing Core/Essential Apps"
brew cask install 1password-beta # highest priority since I need my passwords
brew cask install steam # high priority so I can begin downloading games
sh /Applications/Steam.app/Contents/MacOS/steam.sh >/dev/null 2>&1 &
echo "We just installed Steam so please log into Steam and begin downloading your games now, thanks."
brew cask install google-chrome-beta
brew cask install insync
brew cask install bettertouchtool
brew cask install carbon-copy-cloner
brew cask install spotify
brew cask install microsoft-office
brew cask install vmware-fusion

# Menubar Apps
echo "Installing Menubar Apps"
brew cask install dropbox
brew cask install google-drive
brew cask install onedrive
brew cask install nordvpn
brew cask install semulov
brew cask install spotify-notifications
brew cask install yujitach-menumeters

# Objective-See Security Apps
echo "Installing Security Apps"
brew cask install blockblock
brew cask install oversight
brew cask install ransomwhere

# Code/Computer Science
echo "Installing Code/Computer Science Apps"
brew cask install gitkraken
brew cask install java
brew cask install eclipse-java
brew cask install visual-studio-code
brew cask install powershell

# Other Apps/Utilities
echo "Installing Other Apps/Utilities"
brew cask install adobe-acrobat-reader
brew cask install android-file-transfer
brew cask install appcleaner
brew cask install the-unarchiver
brew cask install tuxera-ntfs
brew cask install osxfuse
brew cask install android-platform-tools

# Install quick look generators
echo "Installing Finder Quick Look generators"
brew cask install betterzipql 
brew cask install qlcolorcode 
brew cask install qlmarkdown 
brew cask install qlstephen

# install brew-cask-upgrade
brew tap buo/cask-upgrade
brew cask install brew-cask-upgrade

# Install apps from Mac App Store
echo "Installing Mac App Store Apps"
mas install 937984704 # Amphetamine
mas install 409201541 # Pages
mas install 409183694 # Keynote
mas install 409203825 # Numbers

# Cleanup
echo "Cleaning up"
brew prune
brew cleanup

echo "Installation of all programs complete!"
echo "The following apps must be installed manually:"
echo "  Acrok Video Converter Ultimate"
echo "  Winclone"
echo "  All Steam games"
echo ""
echo "The following apps must be activated:"
echo "  Acrok Video Converter Ultimate (not installed)"
echo "  Winclone (not installed)"
echo "  Carbon Copy Cloner"
echo "  Tuxera NTFS"
echo "  VMware Fusion"
