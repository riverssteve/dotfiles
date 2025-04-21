#!/usr/bin/env bash

set -euo pipefail

# Path to this script
dirpath="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${dirpath}/../utils.sh"

_config_dir="$HOME/.config/ghostty"

pinfo "Installing ghostty configuration"

[[ ! -d "${_config_dir}" ]] && (
    pinfo "Creating starship config directory..."
    mkdir -p "${_config_dir}"
)

pinfo "Linking starship config..."
ln -svf "${DOTFILES}/ghostty/config" "${_config_dir}/config"
