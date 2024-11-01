{ config, pkgs, pkgs-unstable, ... }:

{
  imports = [
    ./hardware-configuration.nix

    # Core
    ./modules/core/boot.nix
    ./modules/core/networking.nix
    ./modules/core/nix.nix
    ./modules/core/users.nix

    # Desktop
    ./modules/desktop/gnome.nix
    ./modules/desktop/xserver.nix

    # Hardware
    ./modules/hardware/audio.nix
    ./modules/hardware/bluetooth.nix
    ./modules/hardware/graphics.nix

    # Packages
    ./modules/packages/development.nix
    ./modules/packages/system.nix
    ./modules/packages/unstable.nix

    # Services
    ./modules/services/syncthing.nix
  ];

  # This value determines the NixOS release
  system.stateVersion = "24.05";
}
