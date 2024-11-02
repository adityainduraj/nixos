{ config, pkgs-unstable, ... }:

{
  environment.systemPackages = with pkgs-unstable; [
    zed-editor
    neovim

    # theming
    papirus-icon-theme
  ];
}
