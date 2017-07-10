#!/bin/bash

echo "Do you want to proceed with installation of Homebrew and all programs, and is Xcode (or Xcode-beta) installed? (Y/n)"
read installAnswer
if echo "$installAnswer" | grep -iq "^n" ;then
    exit
else
    echo You have chosen to proceed with program installation.
fi

# Set Xcode path to Xcode-beta
xcode-select -s /Applications/Xcode-beta.app

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install brew command line tools
brew install mas
brew install wget
brew install tree

# Enable cask-versions
brew tap caskroom/verisons

# Install apps from cask
brew cask install 1password-beta
brew cask install adobe-acrobat-reader
brew cask install android-file-transfer
brew cask install appcleaner
brew cask install bettertouchtool
brew cask install carbon-copy-cloner
brew cask install dropbox
brew cask install gitkraken
brew cask install google-chrome-beta
brew cask install google-drive
brew cask install insync
brew cask install microsoft-office
brew cask install nordvpn
brew cask install oversight
brew cask install ransomwhere
brew cask install semulov
brew cask install spotify
brew cask install spotify-notifications
brew cask install steam
brew cask install the-unarchiver
brew cask install tuxera-ntfs
brew cask install visual-studio-code
brew cask install vmware-fusion
brew cask install java
brew cask install eclipse-java
brew cask install yujitach-menumeters
brew cask install blockblock
brew cask install osxfuse
brew cask install powershell

# Install quick look generators
brew cask install betterzipql 
brew cask install qlcolorcode 
brew cask install qlmarkdown 
brew cask install qlstephen

