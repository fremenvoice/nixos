#!/usr/bin/env bash
set -e

echo "⚠️ Внимание! Все данные на диске будут удалены!"
read -p "Точно продолжаем разметку (y/n)? " confirm
[ "$confirm" != "y" ] && exit 1

DISKO_CONFIG=./disko-config.nix

nix run github:nix-community/disko -- --mode disko "$DISKO_CONFIG"

HOST=pc
nixos-install --flake .#"${HOST}"

echo "✅ Установка завершена! Можно перезагружаться."
