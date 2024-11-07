{pkgs, ...}: {
  home.packages = with pkgs; [
    gcc
    gnumake
    autoconf
    automake
    libtool
    patch
    pkg-config
  ];
}
