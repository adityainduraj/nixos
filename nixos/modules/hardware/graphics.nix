{
  config,
  lib,
  pkgs,
  ...
}: {
  # used to be hardware.graphics.enable = true;
  hardware.graphics = {
    enable = true;
    # driSupport = true; 24.11 depracated
    # driSupport32Bit = true;
  };

  # Power management - INTEL SPECIFIC COMMENT OUT IF NOT ON INTEL
  powerManagement.enable = true;
  services.thermald.enable = true; # For Intel CPUs

  # NVIDIA SPECIFIC - UNCOMMENT IF USING NVIDIA GPU
  # hardware.nvidia = {
  #   modesetting.enable = true;
  #   powerManagement.enable = true;
  #   open = false;
  #   nvidiaSettings = true;
  #   package = config.boot.kernelPackages.nvidiaPackages.stable;
  # };
  # services.xserver.videoDrivers = ["nvidia"];
}
