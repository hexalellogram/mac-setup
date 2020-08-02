# mac-setup

Hexalellogram's macOS Setup Scripts

## Download and Run

Paste this into the macOS Terminal:

`curl -LOk https://github.com/hexalellogram/mac-setup/archive/master.zip && unzip -a master.zip && rm master.zip && cd mac-setup-master && chmod +x ProgramInstall.sh && ./ProgramInstall.sh`

## Prerequisites

- [Xcode.app or Xcode-beta.app](https://developer.apple.com/download/) installed

## Other Stuff Configured

- macOS System Settings ([Read echo statements here for details](https://github.com/hexalellogram/mac-setup/blob/master/SystemSettings.sh))
- San Francisco [Mono](https://simonfredsted.com/1438) Font Installed
- Terminal configured to my custom settings (see [BasicModified.terminal](https://github.com/hexalellogram/mac-setup/blob/master/BasicModified.terminal)) - BasicModified is essentially the default Dark theme in macOS terminal, modified to use a font size of 14.
- Startup applications configured as per my preferences
- `git pullall` - pulls all Git repositories in the folder `~/Git` except if the folder is named `EZMoney-Releases`. Program is copied to the directory `/usr/local/bin` so the command `git pullall` can be run from any location.
- `brew cask purge` - alias for `brew cask zap` so you can use `brew cask purge chromium` to uninstall Chromium instead of having to use `brew cask zap chromium`. Brings behavior closer to `apt` and `apt-get` on Linux. Program is copied to the directory `/usr/local/bin` so the command `brew cask purge {formula}` can be run from any location.

## Other Stuff You Might Need to Know

- [Code of Conduct](https://github.com/hexalellogram/mac-setup/blob/master/CODE_OF_CONDUCT.md)
- This project is licensed under the [GNU GPL License](https://github.com/hexalellogram/mac-setup/blob/master/LICENSE)
