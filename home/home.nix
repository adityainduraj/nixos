{ config, pkgs, pkgs-unstable, ... }:

{
  imports = [
    ./modules/shell.nix
    ./modules/vscode.nix
    ./modules/packages/development.nix
    ./modules/packages/system.nix
    ./modules/packages/unstable.nix
    ./modules/fonts.nix
  ];

  home.username = "adityainduraj";
  home.homeDirectory = "/home/adityainduraj";
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
