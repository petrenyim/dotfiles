#!/bin/bash

if [[ -n "${SUDO_USER}" ]]; then
  echo "Please run without sudo"
  exit 1
fi

readonly DOTFILES="$(cd $(dirname ${BASH_SOURCE}) && pwd)/../dotfiles"

# Include dotfiles
rm -f "${HOME}/.dotfiles"
ln -s "${DOTFILES}" "${HOME}/.dotfiles"

# Configure alacritty
mkdir -p "${HOME}/.config/alacritty"
rm -f "${HOME}/.config/alacritty/alacritty.yml"
ln -s "${HOME}/.dotfiles/alacritty.yml" "${HOME}/.config/alacritty/alacritty.yml"

# Configure zsh
rm -f "${HOME}/.zshrc"
ln -s "${HOME}/.dotfiles/.zshrc" "${HOME}/.zshrc"
rm -f "${HOME}/.antigenrc"
ln -s "${HOME}/.dotfiles/.antigenrc" "${HOME}/.antigenrc"

