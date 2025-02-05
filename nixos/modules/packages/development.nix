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
    code-cursor

    # nix tools
    # nix-search-cli

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
    pkgs.python312Packages.jupyter-core
    pkgs.python312Packages.jupyter-client
    cmake
    libstdcxx5
    flex
    python311Packages.mesa
    # jupyter-core
    # Node and NPM
    nodejs

    # Rust related stuff
    rustup
    # PCAP Related Stuff
    mpi

    # Build essentials
    autoconf
    automake
    libtool
    patch
    pkg-config
    gcc
  ];
}
