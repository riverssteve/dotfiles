#!/usr/bin/env bash

set -euo pipefail

# Path to this script
dirpath="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${dirpath}/../utils.sh"

# shellcheck disable=SC2086
cd "$(dirname ${0})"

# Check if we're running on GH actions
[ -n "${GITHUB_ACTION:-}" ] && {
    pinfo "Skipping file on GH actions pipeline..."
    exit
}

if ! is_mac; then
    exit
fi

defaults write com.apple.screencapture location ~/Downloads/

# Disable screenshot shadow
defaults write com.apple.screencapture disable-shadow -bool true

# Disable automatic capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable automatic period substitution
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

for app in "Activity Monitor" \
    "Address Book" \
    "Calendar" \
    "cfprefsd" \
    "Contacts" \
    "Dock" \
    "Finder" \
    "Mail" \
    "Messages" \
    "Photos" \
    "Safari" \
    "SizeUp" \
    "Spectacle" \
    "SystemUIServer" \
    "Terminal" \
    "Transmission" \
    "iCal"; do
    killall "${app}" &>/dev/null
done
