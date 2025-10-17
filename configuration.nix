{ config, lib, pkgs, ... }:

{
    system.stateVersion = "25.05";
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nixpkgs.config.allowUnfree = true;

    imports = [
        ./hardware-configuration.nix
        ./nixos-system-config/system-configuration.nix
        ./nixos-system-config/system-packages.nix
        ./nixos-system-config/system-services.nix
        ./nixos-system-config/system-program-settings.nix
        ./nixos-system-config/system-theming.nix
    ];

}