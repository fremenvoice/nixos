{ config, pkgs, ... }:

{
  imports = [ ./disko-config.nix ];

  # Hostname
  networking.hostName = "vm";
  time.timeZone = "Europe/Moscow";

  # Русско-английская раскладка, переключение Alt+Shift
  services.xserver = {
    enable = true;
    layout = "us,ru";
    xkbOptions = "grp:alt_shift_toggle";
    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = false;
  };

  services.xserver.desktopManager.gnome.enable = false;
  programs.hyprland.enable = true;

  # Установка нужных пакетов
  environment.systemPackages = with pkgs; [
    firefox
    konsole
    vim
    git
    wget
  ];

  # Пользователь
  users.users.nixos = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    password = "nixos";
  };

  # Разрешаем sudo
  security.sudo.wheelNeedsPassword = false;

  # Сеть через NetworkManager
  networking.networkmanager.enable = true;

  # Включить OpenSSH
  services.openssh.enable = true;
}
