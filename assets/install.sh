#!/bin/bash

if [[ -z "${SUDO_USER}" ]]; then
  echo "Please run with sudo"
  exit 1
fi

# Refresh repos
add-apt-repository ppa:mmstick76/alacritty -y
apt update

# Install tools
apt install -y git neovim tmux cargo ripgrep mlocate curl
apt install -y alacritty
apt install -y zsh
apt install -y npm
apt install -y fzf
apt install -y ruby

cargo install du-dust
cp /root/.cargo/bin/dust /bin/dust

# Zsh
curl -L git.io/antigen > "/usr/bin/antigen.zsh"

# Install z
wget -O /usr/bin/z.sh https://raw.githubusercontent.com/rupa/z/master/z.sh
chmod +x /usr/bin/z.sh

# nvim
apt install -y python3-pip
pip3 install pynvim
