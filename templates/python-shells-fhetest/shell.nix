## Create the python venv AFTER entering the shell
with import <nixpkgs> {};
  mkShell {
    NIX_LD_LIBRARY_PATH = lib.makeLibraryPath [
      stdenv.cc.cc
      zlib
      mesa
      pkgs.libglvnd
      pkgs.glib
    ];
    NIX_LD = lib.fileContents "${stdenv.cc}/nix-support/dynamic-linker";
    buildInputs = [python311 mesa pkgs.libglvnd pkgs.glib];
    shellHook = ''
      export LD_LIBRARY_PATH=$NIX_LD_LIBRARY_PATH
    '';
  }
