{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (python3.withPackages(ps: with ps; [
      pip
      virtualenv
      tkinter
    ]))

    # nix setup for code editors
    alejandra # formatter
    nixd # nix lsp

    # Node and NPM
    nodejs

    # Build essentials
    autoconf
    automake
    libtool
    patch
    pkg-config
  ];
}
