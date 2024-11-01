{ config, pkgs, ... }:

{
  # Enhanced Bluetooth Configuration
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    package = pkgs.bluez;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true;
        KernelExperimental = true;
        FastConnectable = true;
        MultiProfile = "multiple";
      };
      Policy = {
        AutoEnable = true;
      };
    };
  };

  # Bluetooth management services
  services.blueman.enable = true;

  # Add Bluetooth-related packages
  environment.systemPackages = with pkgs; [
    bluez
    bluez-tools
    bluez-alsa
  ];
}
