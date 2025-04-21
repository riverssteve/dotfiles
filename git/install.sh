#!/usr/bin/env bash

set -euo pipefail

# Path to this script
dirpath="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${dirpath}/../utils.sh"

_config_dir="$HOME/.config/ghostty"

pinfo "Linking git config..."
# Copy all symlink files to the target directory
for file in "${dirpath}"/*.symlink; do
    filename=$(basename "$file")
    target_name=${filename%.symlink}
    ln -svf "${DOTFILES}/git/${file}" "${HOME}/${target_name}"
done
