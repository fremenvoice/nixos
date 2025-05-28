{ config, pkgs, ... }:

{
  imports = [ ./disko-config.nix ];

  # GRUB bootloader (требуется для загрузки!)
  boot.loader.grub.enable = true;
  boot.loader.grub.devices = [ "/dev/sda" ];

  networking.hostName = "vm";
  time.timeZone = "Europe/Samara";

  services.xserver = {
    enable = true;
    layout = "us,ru";
    xkbOptions = "grp:alt_shift_toggle";
    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = false;
  };

  services.xserver.desktopManager.gnome.enable = false;
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    firefox
    konsole
    nano
    git
    wget
  ];

  users.users.fremen = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    password = "fremen";
  };

  security.sudo.wheelNeedsPassword = false;

  networking.networkmanager.enable = true;
  services.openssh.enable = true;
}
