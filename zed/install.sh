#!/usr/bin/env bash

set -euo pipefail

# Path to this script
dirpath="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${dirpath}/../utils.sh"

pinfo "Copying zed config files"

_target="${HOME}/.config/zed"
if [[ ! -d "${_target}" ]]; then
    mkdir -p "${_target}"
fi

# Copy all JSON files to the target directory
for file in "${dirpath}"/*.json; do
    cp -v "${file}" "${_target}/"
done
