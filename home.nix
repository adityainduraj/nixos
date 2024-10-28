{ config, pkgs, pkgs-unstable, ... }:

{
  home.username = "adityainduraj";
  home.homeDirectory = "/home/adityainduraj";
  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    # Stable packages
    tree
    gcc
    gnumake
    autoconf
    automake
    libtool
    patch
    pkg-config
  ] ++ (with pkgs-unstable; [
    # Unstable packages
  ]);

  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      ".." = "cd ..";
    };

    initExtra = ''
      # Explicitly set HOME
      export HOME="${config.home.homeDirectory}"

      # Use a simpler PS1 first to test
      PS1='[\u@\h:~]\$ '
    '';
  };

  programs.home-manager.enable = true;
}
