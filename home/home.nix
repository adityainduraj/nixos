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
    fastfetch
    neofetch

    # fonts
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

      # Use \w for proper path display with tilde
      PS1='[\u@\h:\w]\$ '
    '';
  };

 # direnv hook for bash
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableBashIntegration = true;  # if using bash
    enableZshIntegration = true;   # if using zsh
    };

  programs.home-manager.enable = true;
}
