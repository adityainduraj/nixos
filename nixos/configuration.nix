{
  config,
  pkgs,
  pkgs-unstable,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    # Modules
    ./modules/core
    ./modules/desktop
    ./modules/hardware
    ./modules/packages
    ./modules/services
  ];

  # This value determines the NixOS release
  system.stateVersion = "24.11";
}
