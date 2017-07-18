#!/bin/bash

echo "Setting Up Touch ID PAM Module"
git clone https://github.com/hamzasood/pam_touchid
cd pam_touchid
xcodebuild -project pam_touchid.xcodeproj build
cp build/Release/pam_touchid.so.2 $OLDPWD
cd -
chmod 444 pam_touchid.so.2
sudo chown root:wheel pam_touchid.so.2
sudo mkdir /usr/local/lib/pam/
sudo cp pam_touchid.so.2 /usr/local/lib/pam/
sudo cp /etc/pam.d/sudo $PWD/sudo.bak
echo "Old /etc/pam.d/sudo backed up to $PWD/sudo.bak"
sudo cp sudo /etc/pam.d/sudo
echo "Touch ID PAM Module Set Up"