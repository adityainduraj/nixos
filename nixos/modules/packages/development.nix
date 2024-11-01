{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (python3.withPackages(ps: with ps; [
      pip
      virtualenv
      tkinter
    ]))

    neovim
    alejandra

    # Build essentials
    autoconf
    automake
    libtool
    patch
    pkg-config
  ];
}
