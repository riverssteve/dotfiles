#!/usr/bin/env bash

set -euo pipefail

# Path to this script
dirpath="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${dirpath}/../utils.sh"

pinfo "Installing editorconfig"

pinfo "Linking editorconfig..."
ln -svf "${DOTFILES}/editorconfig/editorconfig.symlink" "${HOME}/.editorconfig"
