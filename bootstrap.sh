#!/usr/bin/env bash

set -euo pipefail

is_mac() {
    if [[ $(uname) == "Darwin" ]]; then
        return 0 # true
    else
        return 1 # false
    fi
}

is_ubuntu() {
    if [[ $(uname) == "Linux" ]] && [[ -n $(command -v apt-get) ]]; then
        return 0 # true
    else
        return 1 # false
    fi
}

if ! command -v git; then
    if is_ubuntu; then
        sudo apt-get update && sudo apt-get install -y git
    fi
fi

if [ ! -d "$HOME/.dotfiles" ]; then
    echo "[Bootstrap] Cloning dotfiles"
    git clone --recursive https://github.com/riverssteve/dotfiles.git "$HOME/.dotfiles"
fi

# install homebrew
if ! command -v brew; then
    if is_mac; then
        echo "[Bootstrap] Installing Homebrew"
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

        echo "[Bootstrap] Install a newer bash"
        brew install bash
    fi
fi

if [[ ! -d $HOME/.config ]]; then
    echo "[Bootstrap] Creating $HOME/.config"
    mkdir -p "$HOME/.config"
fi

echo ""
printf "%s\n" "Remember to set up GPG keys for git usage"
printf "%s\n" "See https://stackoverflow.com/questions/41052538/git-error-gpg-failed-to-sign-data"

cd "$HOME/.dotfiles"
./install.sh
