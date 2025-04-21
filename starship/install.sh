#!/usr/bin/env bash

set -euo pipefail

# Path to this script
dirpath="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
source "${dirpath}/../utils.sh"

starship_config="$HOME/.config"

pinfo "Installing starship"

[[ ! -d ${starship_config} ]] && (
    pinfo "Creating starship config directory..."
    mkdir -p "${starship_config}"
)

pinfo "Linking starship config..."
ln -svf "${DOTFILES}/starship/starship.toml" "${starship_config}"
