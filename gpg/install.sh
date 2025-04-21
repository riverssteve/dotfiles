#!/usr/bin/env bash

set -euo pipefail

# Path to this script
dirpath="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${dirpath}/../utils.sh"

if is_mac && ! command -v pinentry-mac >/dev/null 2>&1; then
    pinfo "pinentry-mac not found, installing"
    brew install pinentry-mac
fi

# shellcheck disable=SC2086
cd "$(dirname ${0})"

AGENT=gpg-agent.conf
test -d ~/.gnupg || {
    AGENT=gpg-agent.conf
    if is_mac && [[ $(uname -m) == "arm64" ]]; then
        AGENT=gpg-agent-arm64.conf
    fi
    mkdir ~/.gnupg
}

test -L ~/.gnupg/gpg-agent.conf || {
    ln -sfv "$DOTFILES/gpg/$AGENT" ~/.gnupg/gpg-agent.conf
}

test -L ~/.gnupg/gpg.conf || {
    ln -sfv "$DOTFILES/gpg/gpg.conf" ~/.gnupg/gpg.conf
}
