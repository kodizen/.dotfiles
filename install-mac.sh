#!/bin/zsh

# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install

# Install Brew
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

# Brew Taps
echo "Installing Brew Formulae..."
brew tap homebrew/cask-fonts
brew tap FelixKratz/formulae

# Brew Formulae
brew install llvm
brew install mas
brew install neovim
brew install tree
brew install wget
brew install golang
brew install jq
brew install gh
brew install neofetch
brew install alfred
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install weechat
brew install newsboat

# Brew Casks
echo "Installing Brew Casks..."
brew install --cask zoom
brew install --cask vlc

# Install modded fira code font
echo "Installing Fira Code font..."
brew install --cask font-fira-code-nerd-font

# macOS Settings
echo "Changing macOS defaults..."
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.spaces spans-displays -bool false
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock "mru-spaces" -bool "false"
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write com.apple.LaunchServices LSQuarantine -bool false
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain _HIHideMenuBar -bool true
defaults write NSGlobalDomain AppleHighlightColor -string "0.65098 0.85490 0.58431"
defaults write NSGlobalDomain AppleAccentColor -int 1
defaults write com.apple.screencapture location -string "$HOME/Desktop"
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.Finder AppleShowAllFiles -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder ShowStatusBar -bool false
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool YES
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Tell iterm2 to use custom preferences set in dotfiles
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$HOME/.dotfiles/iterm2"

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting


