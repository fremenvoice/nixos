#!/usr/bin/env bash
set -e

THISDIR="$(cd "$(dirname "$0")"; pwd)"
PROFILENAME="$(basename "$THISDIR")"

echo "WARNING: All data on /dev/sda will be erased!"
read -p "Proceed with disk partitioning and installation? (y/n): " confirm
[ "$confirm" != "y" ] && exit 1

export NIX_CONFIG="experimental-features = nix-command flakes"
nix run github:nix-community/disko -- --mode disko "$THISDIR/disko-config.nix"
nixos-install --flake "$THISDIR#$PROFILENAME"

echo "Installation finished! You can reboot now."
