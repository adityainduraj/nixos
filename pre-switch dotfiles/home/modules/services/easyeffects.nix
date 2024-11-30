{
  config,
  lib,
  pkgs,
  ...
}: {
  services.easyeffects = {
    enable = true;
    # Add any additional EasyEffects configuration here if needed
  };
}
