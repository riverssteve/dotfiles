#!/usr/bin/env bash

# Path to this script
dirpath="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${dirpath}/../utils.sh"
_fish_config="${HOME}/.config/fish"

if is_mac; then
    if ! grep -q '/opt/homebrew/bin/fish' /etc/shells; then
        pinfo "Adding fish to /etc/shells"
        sudo sh -c 'echo "$(which fish)" >> /etc/shells'
        sudo chsh -s "$(command -v fish)" "$(whoami)"
    fi
fi

# Install fisher
pinfo "Install fisher"

fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/4.4.5/functions/fisher.fish | source && fisher install jorgebucaran/fisher"

# Install plugins
pinfo "Install plugins for fisher"
fish -c "fisher install jethrokuan/z"
fish -c "fisher install catppuccin/fish"
fish -c "fisher install vitallium/tokyonight-fish"

ln -svf "${DOTFILES}/fish/config.fish" "${_fish_config}/config.fish"

_extra="${HOME}/.config/fish/extras.fish"
[ -f "${_extra}" ] || {
    touch "${HOME}/.config/fish/extras.fish"
}

_secret="${HOME}/.config/fish/secrets.fish"
[ -f "${_secret}" ] || {
    touch "${_secret}"
    chmod 600 "${_secret}"
}

# Fetch completions
if command -v docker >/dev/null 2>&1; then
    _docker_version="v$(docker --version | cut -d' ' -f3 | tr -d ',')"
    mkdir -p "${_fish_config}/completions"
    _url="https://raw.githubusercontent.com/docker/cli/refs/tags/${_docker_version}/contrib/completion/fish/docker.fish"
    pinfo "Fetching completions from ${_url}"
    curl -sL "${_url}" -o "${_fish_config}/completions/docker.fish"
fi
