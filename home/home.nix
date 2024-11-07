{
  config,
  pkgs,
  pkgs-unstable,
  ...
}: {
  imports = [
    ./modules/desktop
    ./modules/development
    ./modules/packages
    ./modules/services
    ./modules/shell
  ];

  home.username = "adityainduraj";
  home.homeDirectory = "/home/adityainduraj";
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
