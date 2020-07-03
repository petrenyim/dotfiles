#!/bin/bash

if [[ -n "${SUDO_USER}" ]]; then
  echo "Please run without sudo"
  exit 1
fi

readonly DOTFILES="$(cd $(dirname ${BASH_SOURCE}) && pwd)/../dotfiles"
readonly DATE="$(date '+%Y%m%d%H%M%S')"

mkdir -p ~/.config

# Include dotfiles
mv "${HOME}/.dotfiles" "${HOME}/.dotfiles.${DATE}"
ln -s "${DOTFILES}" "${HOME}/.dotfiles"

# Configure alacritty
mkdir -p "${HOME}/.config/alacritty"
mv "${HOME}/.config/alacritty/alacritty.yml" "${HOME}/.config/alacritty/alacritty.yml.${DATE}"
ln -s "${HOME}/.dotfiles/alacritty.yml" "${HOME}/.config/alacritty/alacritty.yml"

# Configure zsh
mv "${HOME}/.zshrc" "${HOME}/.zshrc.${DATE}"
ln -s "${HOME}/.dotfiles/.zshrc" "${HOME}/.zshrc"
mv "${HOME}/.antigenrc" "${HOME}/.antigenrc.${DATE}"
ln -s "${HOME}/.dotfiles/.antigenrc" "${HOME}/.antigenrc"

# Configure nvim
mv "${HOME}/.config/nvim" "${HOME}/.config/nvim.${DATE}"
git clone git://github.com/rafi/vim-config.git "${HOME}/.config/nvim"
