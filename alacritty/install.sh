#!/usr/bin/env bash

set -euo pipefail

# Path to this script
dirpath="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${dirpath}/../utils.sh"

_config_dir="${HOME}/.config/alacritty"

pinfo "Setting up alacritty..."

[[ ! -d "${_config_dir}" ]] && (
    pinfo "Creating alacritty config directory"
    mkdir -pv "${_config_dir}"
)

pinfo "Copying configuration and theme"
ln -svf "$PWD/alacritty/alacritty.toml" "${_config_dir}/alacritty.toml"
ln -svf "$PWD/alacritty/tokyo-night.toml" "${_config_dir}/tokyo-night.toml"
