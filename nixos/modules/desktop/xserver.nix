{ config, pkgs, ... }:

{
  # Enable the X11 windowing system
  services.xserver = {
    enable = true;

    # Configure keymap
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  # Enable printing
  services.printing.enable = true;
}
