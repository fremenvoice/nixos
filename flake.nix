{
  description = "NixOS VM install with Disko and Hyprland";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    disko.url = "github:nix-community/disko";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, disko, hyprland, ... }: {
    nixosConfigurations.vm = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        disko.nixosModules.disko
        hyprland.nixosModules.default
      ];
    };
  };
}
