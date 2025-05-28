#!/usr/bin/env bash
set -e

echo "⚠️ Vnimanie! Vse dannie na diske budut udaleni!"
read -p "Tochno prodolzhaem razmetku?(y/n)? " confirm
[ "$confirm" != "y" ] && exit 1

DISKO_CONFIG=./disko-config.nix

nix run github:nix-community/disko -- --mode disko "$DISKO_CONFIG"

HOST=pc
nixos-install --flake .#"${HOST}"

echo "✅ Ustanovka zavershena! Peregruzhai mashinu."
