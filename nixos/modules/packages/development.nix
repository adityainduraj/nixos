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

    # nix setup for code editors
    unzip
    alejandra # formatter
    nixd # nix lsp
    marksman # markdown lsp
    clang-tools # c language lsp
    stylua
    pyright
    ruff-lsp
    ruff
    black

    # stuff for academics
    tcpdump

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
