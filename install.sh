#!/usr/bin/env bash

# This script installs the necessary dependencies for the project.

rm hardware-configuration.nix
rm -rf ../.p10k.zsh
rm -rf ../.config/dunst
rm -rf ../.config/hypr
rm -rf ../.config/kitty
rm -rf ../.config/ncspot

cp dotfiles/.p10k.zsh ../.p10k.zsh
cp -r dotfiles/.config/dunst ../.config/dunst
cp -r dotfiles/.config/hypr ../.config/hypr
cp -r dotfiles/.config/kitty ../.config/kitty
cp -r dotfiles/.config/ncspot ../.config/ncspot
cp /etc/nixos/hardware-configuration.nix .

# Install NixOS configuration
git submodule update --init --recursive
sudo nixos-rebuild switch --flake .# --show-trace
hyprctl reload
