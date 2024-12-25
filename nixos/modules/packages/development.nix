{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    (python3.withPackages (ps:
      with ps; [
        pip
        virtualenv
        tkinter
      ]))

    # ide
    zed-editor

    # nix tools
    nix-search-cli

    # nix setup for code editors
    unzip
    alejandra # formatter
    nixd # nix lsp
    nix-doc
    manix
    marksman # markdown lsp
    clang-tools # c language lsp
    lua-language-server # lua lsp
    stylua
    pyright
    ruff-lsp
    ruff
    black
    ripgrep
    lazygit

    # Node and NPM
    nodejs

    # Build essentials
    autoconf
    automake
    libtool
    patch
    pkg-config
    gcc
  ];
}
