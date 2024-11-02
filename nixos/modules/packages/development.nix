{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (python3.withPackages(ps: with ps; [
      pip
      virtualenv
      tkinter
    ]))

    alejandra

    # Build essentials
    autoconf
    automake
    libtool
    patch
    pkg-config
  ];
}
