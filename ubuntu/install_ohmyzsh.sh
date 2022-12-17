#!/bin/sh
set -e

echo "==> Installing ohmyzsh"

# zsh is required
zsh --version

if [ -d ~/.oh-my-zsh ]; then
  echo "ohmyzsh is already installed"
else
  sudo apt install curl git -y
  # https://github.com/ohmyzsh/ohmyzsh#unattended-install
  # Run this script using zsh so that .zshrc is read properly
  zsh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi