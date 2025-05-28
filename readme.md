# NixOS: Автоматизированная установка (VM/PC)

## Структура репозитория

* `vm/` — минимальная конфигурация для виртуальной машины (без swap)
* `pc/` — конфигурация для физического ПК с поддержкой swap и гибернации

## Быстрый старт

1. Клонируй репозиторий и выбери профиль:

   ```sh
   git clone https://github.com/fremenvoice/nixos.git
   cd nixos/pc    # или nixos/vm
   ```
2. Проверь имя своего системного диска через `lsblk`.

   * В `disko-config.nix` укажи актуальный device (`/dev/sda` или `/dev/nvme0n1`).
   * Для PC swap размечается с label "swap".
3. Запусти установку:

   ```sh
   chmod +x install.sh
   ./install.sh
   ```

   Скрипт предупредит об удалении всех данных на выбранном диске!
4. Дождись завершения установки и перезагрузи систему.

   * Для PC гибернация работает автоматически (UUID swap прописывать не надо).
   * Пользователь: `fremen` (сменить пароль после входа).

## Проверка перед установкой на PC

* Имя целевого диска в `disko-config.nix` должно быть актуальным.
* Swap-раздел с label "swap", параметр `boot.resumeDevice` — `/dev/disk/by-label/swap`.
* Все данные на целевом диске будут удалены — сделай резервные копии!
* Для flakes требуется интернет.

## После установки

* Войти под пользователем `fremen`.
* Сменить пароль пользователя.
* Проверить swap и гибернацию:

  ```sh
  cat /proc/swaps
  systemctl hibernate
  ```
* Для гибернации: убедись, что BIOS/UEFI её поддерживает.

## Кастомизация

* Все настройки (DE, пакеты, пользователи, сервисы) меняются в `configuration.nix` выбранного профиля.
* При необходимости адаптируй конфиги под железо.

## Полезные ссылки

* [NixOS Disko](https://github.com/nix-community/disko)
* [NixOS Flakes](https://nixos.wiki/wiki/Flakes)
* [NixOS Hyprland](https://github.com/hyprwm/Hyprland)
* [NixOS Wiki: Hibernate](https://nixos.wiki/wiki/Suspend_and_hibernate#Using_swap_partition)

**Установка полностью автоматизирована, swap/гибернация на PC работает без ручной правки UUID!**
sudo -i
nix-shell -p git
git clone https://github.com/fremenvoice/nixos.git
cd nixos/vm
export NIX_CONFIG="experimental-features = nix-command flakes"
chmod +x install.sh
./install.sh
reboot
