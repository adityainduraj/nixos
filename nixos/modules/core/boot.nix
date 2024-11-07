{
  config,
  lib,
  pkgs,
  ...
}: {
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 3; # Keep only 3 generations in boot menu
    };
    efi.canTouchEfiVariables = true;
  };
}
