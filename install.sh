#!/usr/bin/env bash

set -euo pipefail

# Path to this script
dirpath="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${dirpath}/utils.sh"

# shellcheck disable=SC2086
cd "$(dirname ${0})"

# shellcheck disable=SC2155
export DOTFILES=$(pwd)
export ICLOUD_CONFIG=~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Config

shopt -s globstar nullglob
pinfo "Creating symlinks"
for file in "${DOTFILES}"/**/*.symlink; do
    # %.* removes all characters including and after the dot
    ln -sfv "${file}" "$HOME/.$(basename "${file%.*}")"
done

if is_mac; then
    pinfo "Installing homebrew bundle"
    brewfile_path="${dirpath}/homebrew/m1.brewfile"
    pinfo "Installing brewfile from ${brewfile_path}"
    pwarn "Some commands may require sudo priviledges"
    brew bundle --file="${brewfile_path}" -v install || pwarn "bundle encoutered errors, continuing"
elif is_ubuntu; then
    bash -eu -o pipefail ubuntu/packages.sh
fi

find "${DOTFILES}" -name 'install.sh' -mindepth 2 -print0 | while read -rd $'\0' file; do
    pinfo "Running installer ${file}"
    bash -eu -o pipefail "${file}"
done
