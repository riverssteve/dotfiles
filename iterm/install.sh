#!/usr/bin/env bash

set -euo pipefail

catppuchin_theme="https://raw.githubusercontent.com/catppuccin/iterm/91a17d3bfb03c7929cf8f49f97e44e541861373c/colors/"
_theme_checksum="1e02f836db8e3c86368ea79bc6ac7c690311796e"

catppuchin_dircolors="https://raw.githubusercontent.com/ss77a/Catppuccin-dircolors/a8963a1bd6ea2cf8f267ac168a3530fccd7b1519/bliss.dircolors"
_dircolor_checksum="b731326d0f46134f530f3227ae3fdd6f5bdec6eb"

iterm_data_path="${HOME}/.config/iterm/data"

variants=(
  "catppuccin-frappe.itermcolors"
  "catppuccin-latte.itermcolors"
  "catppuccin-macchiato.itermcolors"
  "catppuccin-mocha.itermcolors"
)

# Path to this script
dirpath="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
source "${dirpath}/../utils.sh"

download() {
    local target=$1 path=$2 filename=$3
    if ! [[ -d ${path} ]] ; then
        fail "Bad path for file download"
        exit 1
    fi
    if ! [[ -f "${path}/${filename}" ]] ; then
        pinfo "Downloading ${filename}"
        remote_checksum=$(curl -s "${target}" | sha1sum)
        checksum="${_theme_checksum}"
        echo "checksum: $checksum"
        echo "remote checksum: $remote_checksum"
        echo $target
        curl "${target}" >> "${path}/${filename}" 2>/dev/null
    fi
}

mkdir -p "${iterm_data_path}"
download "${catppuchin_dircolors}" "${iterm_data_path}" "catppuccin-macciato.dircolors"
for variant in "${variants[@]}"; do
    pinfo "Downloading variant ${variant}"
    download "${catppuchin_theme}${variant}" "${iterm_data_path}" "${variant}"
done


if ! [[ -f $HOME/.dircolors ]] ; then
    pinfo "Linking dircolors"
    ln -sfv "${iterm_data_path}/catppuccin-frappe.dircolors" "$HOME/.dircolors"
else
    pwarn "Refusing to overwrite exisiting dircolors file"
fi

if [[ -f "${iterm_data_path}/catppuccin-frappe.itermcolors" ]] ; then
    pinfo "Run the following to import the theme into iterm: \"open ${iterm_data_path}/catppuccin-frappe.itermcolors\""
fi

# Italics
if [[ $( command -v tic ) ]] ; then
    # See https://stackoverflow.com/a/48512956
    # and https://github.com/tmux/tmux/issues/696
    tic "${DOTFILES}/iterm/xterm-256color-italic.terminfo"
    echo "New TERM 'xterm-256color-italic' available"
    echo "Modify the 'Report terminal type' field in Profiles > Terminal"
fi

