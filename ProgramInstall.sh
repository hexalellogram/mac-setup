#!/bin/bash

echo "Do you want to proceed with installation of Homebrew and all programs, and is Xcode (or Xcode-beta) installed? (Y/n)"
read installAnswer
if echo "$installAnswer" | grep -iq "^n" ;then
    exit
else
    echo You have chosen to proceed with application installation.
fi

# Set Xcode path to Xcode-beta
xcode-select -s /Applications/Xcode-beta.app

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

# Install command line tools from brew
brew install mas
brew install wget
brew install tree
brew install m-cli
brew install archey

# Enable cask-versions
brew tap caskroom/verisons

# Install apps from brew cask

# Core/Essential Apps
brew cask install 1password-beta
brew cask install google-chrome-beta
brew cask install insync
brew cask install bettertouchtool
brew cask install steam # high priority so I can begin downloading games
echo We just installed Steam so please log into Steam and begin downloading your games now, thanks.
brew cask install carbon-copy-cloner
brew cask install spotify
brew cask install microsoft-office
brew cask install vmware-fusion


# Menubar Apps
brew cask install dropbox
brew cask install google-drive
brew cask install onedrive
brew cask install nordvpn
brew cask install semulov
brew cask install spotify-notifications
brew cask install yujitach-menumeters

# Objective-See Security Apps
brew cask install blockblock
brew cask install oversight
brew cask install ransomwhere

# Code/Computer Science
brew cask install gitkraken
brew cask install java
brew cask install eclipse-java
brew cask install visual-studio-code
brew cask install powershell

# Other Apps/Utilities
brew cask install adobe-acrobat-reader
brew cask install android-file-transfer
brew cask install appcleaner
brew cask install the-unarchiver
brew cask install tuxera-ntfs
brew cask install osxfuse

# Install quick look generators
brew cask install betterzipql 
brew cask install qlcolorcode 
brew cask install qlmarkdown 
brew cask install qlstephen

# install brew-cask-upgrade
brew tap buo/cask-upgrade
brew cask install brew-cask-upgrade

# Install apps from Mac App Store
mas install 937984704 # Amphetamine
mas install 409201541 # Pages
mas install 409183694 # Keynote
mas install 409203825 # Numbers

# Cleanup
brew prune
brew cleanup

echo Apps not installed that must be installed manually: Acrok Video Converter, Winclone, all Steam games