#!/usr/bin/env bash

set -euo pipefail

# Path to this script
dirpath="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${dirpath}/../utils.sh"

hash zellij || {
    pwarn "zellij not found"
    exit 0
}

_config_dir="${HOME}/.config/zellij"

pinfo "Setting up zellij..."

[[ -d "${_config_dir}" ]] || (
    pinfo "Creating zellij config directory"
    mkdir -pv "${_config_dir}"
)
[[ -d "${_config_dir}/themes" ]] || (
    pinfo "Creating zellij theme directory"
    mkdir -pv "${_config_dir}/themes"
)

pinfo "Copying configuration and theme"
ln -svf "$PWD/zellij/zellij.kdl" "${_config_dir}/config.kdl"
ln -svf "$PWD/zellij/tokyo-night.kdl" "${_config_dir}/themes/tokyo-night.kdl"

pinfo "zellij/layouts contains a layout template that can be configured."
