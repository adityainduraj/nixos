{
  config,
  lib,
  pkgs,
  ...
}: {
  # Enable wireless support
  networking.wireless.enable = false; # Disable wpa_supplicant as we're using NetworkManager
  networking.networkmanager.wifi.powersave = false;

  # Intel WiFi firmware
  hardware.enableRedistributableFirmware = true;

  # INTEL WIFI SPECIFIC, COMMENT OUT IF NOT ON INTEL
  # Kernel module options for iwlwifi
  boot.extraModprobeConfig = ''
    options iwlwifi power_save=0
    options iwlwifi uapsd_disable=1
    options iwlmvm power_scheme=1
  '';

  # Add necessary packages
  environment.systemPackages = with pkgs; [
    pciutils
    iw # Modern replacement for wireless-tools
    wireguard-tools
  ];
}
