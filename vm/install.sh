#!/usr/bin/env bash
set -e

echo "⚠️ Все данные на /dev/sda будут удалены!"
read -p "Продолжить разметку и установку? (y/n): " confirm
[ "$confirm" != "y" ] && exit 1

DISKO_CONFIG=./disko-config.nix

nix run github:nix-community/disko -- --mode disko "$DISKO_CONFIG"

HOST=vm
nixos-install --flake .#"${HOST}"

echo "✅ Установка завершена! Перезагружай ВМ."
