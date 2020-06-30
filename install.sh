#!/bin/bash

if [[ -z "${SUDO_USER}" ]]; then
  echo "Please run with sudo"
  exit 1
fi

# Install alacritty on host
apt install -y alacritty

rm -f "/home/${SUDO_USER}/.config/alacritty/alacritty.yml"
ln -s ./dotfiles/alacritty.yml "/home/${SUDO_USER}/.config/alacritty/alacritty.yml"
