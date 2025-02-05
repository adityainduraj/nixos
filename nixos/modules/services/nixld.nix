# .dotfiles/nixos/modules/services/nixld.nix
{ config, pkgs, ... }: {
  programs.nix-ld.enable = true;

  programs.nix-ld.libraries = with pkgs; [
    # existing libraries...
    stdenv.cc.cc
    stdenv.cc.cc.lib  # Add this explicitly for libstdc++
    zlib
    fuse3
    libgcc
    icu
    nss
    openssl
    curl
    expat
    libstdcxx5
    glib
    gtk3
    libGL
    libGLU
    xorg.libX11
    xorg.libXext
    xorg.libXrender
  ];
}
