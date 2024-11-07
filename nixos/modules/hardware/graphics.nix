{
  config,
  lib,
  pkgs,
  ...
}: {
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Power management
  powerManagement.enable = true;
  services.thermald.enable = true; # For Intel CPUs
}
