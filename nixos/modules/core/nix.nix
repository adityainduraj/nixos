{ config, lib, pkgs, ... }:

{
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
    };

    # Garbage collection settings
    gc = {
      automatic = false;  # Disabling automatic time-based GC
      dates = "never";
      options = "--delete-generations old --profile /nix/var/nix/profiles/system +3";
    };

    # Storage optimization
    extraOptions = ''
      min-free = 1073741824  # Keep at least 1GB free
      max-free = 5368709120  # Max 5GB free after GC
    '';
  };

  # Enable firmware updates and SSD support
  services.fwupd.enable = true;
  services.fstrim.enable = true;
}
