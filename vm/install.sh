#!/usr/bin/env bash
set -e

echo "⚠️ Vse dannie budut udaleni!"
read -p "Prodolzhit ustanovku? (y/n): " confirm
[ "$confirm" != "y" ] && exit 1

export NIX_CONFIG="experimental-features = nix-command flakes"
nix run github:nix-community/disko -- --mode disko ./disko-config.nix

nixos-install --flake .#vm

echo "✅ ustanovka zavershena."
