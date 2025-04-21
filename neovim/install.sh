#!/usr/bin/env bash

set -euo pipefail

# Path to this script
dirpath="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${dirpath}/../utils.sh"

nvim_config="${HOME}/.config"

pinfo "Setting up neovim..."

[[ ! -d "${nvim_config}" ]] && (
    pinfo "Creating nvim config directory"
    mkdir -pv "${nvim_config}"
)
cp -rv "$PWD/neovim/nvim" "${nvim_config}"
