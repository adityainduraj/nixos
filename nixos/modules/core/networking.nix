{ config, ... }:

{
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;

    # Basic firewall configuration
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22000  # Syncthing transfer
      ];
      allowedUDPPorts = [
        22000  # Syncthing transfer
        21027  # Syncthing discovery
      ];
    };
  };

  # Rest of your existing networking config...
  time.timeZone = "Asia/Kolkata";

  i18n = {
    defaultLocale = "en_IN";
    extraLocaleSettings = {
      LC_ADDRESS = "en_IN";
      LC_IDENTIFICATION = "en_IN";
      LC_MEASUREMENT = "en_IN";
      LC_MONETARY = "en_IN";
      LC_NAME = "en_IN";
      LC_NUMERIC = "en_IN";
      LC_PAPER = "en_IN";
      LC_TELEPHONE = "en_IN";
      LC_TIME = "en_IN";
    };
  };
}
