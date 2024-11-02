{ config, lib, pkgs, ... }:

{
  # Enable fingerprint support
  services.fprintd = {
    enable = true;
    package = pkgs.fprintd;
  };

  # Add necessary packages
  environment.systemPackages = with pkgs; [
    fprintd
    libfprint
  ];
}
