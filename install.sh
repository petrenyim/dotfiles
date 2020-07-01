#!/bin/bash

if [[ -z "${SUDO_USER}" ]]; then
  echo "Please run with sudo"
  exit 1
fi

# Install alacritty on host
add-apt-repository ppa:mmstick76/alacritty
apt update
apt install -y alacritty

mkdir -p "/home/${SUDO_USER}/.config/alacritty"
rm -f "/home/${SUDO_USER}/.config/alacritty/alacritty.yml"
ln -s "$(cd $(dirname ${BASH_SOURCE}) && pwd)/dotfiles/alacritty.yml" "/home/${SUDO_USER}/.config/alacritty/alacritty.yml"

# Include dotfiles
ln -s "$(cd $(dirname ${BASH_SOURCE}) && pwd)/dotfiles" "/dotfiles"
echo "source /dotfiles/include" >> "$(getent passwd ${SUDO_USER} | cut -d: -f6)/.bashrc"
