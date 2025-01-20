# needs a requirements.txt file to handle packages and version locking.

{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.python310
    pkgs.python310Packages.pip
    pkgs.python310Packages.virtualenv
    pkgs.python310Packages.numpy
    pkgs.python310Packages.numpy
    pkgs.python310Packages.pandas
  ];

  shellHook = ''
    export VIRTUAL_ENV=$PWD/.venv
    export PATH=$VIRTUAL_ENV/bin:$PATH
    if [ ! -d "$VIRTUAL_ENV" ]; then
        virtualenv $VIRTUAL_ENV
        source $VIRTUAL_ENV/bin/activate
        pip install -r requirements.txt
    else
        source $VIRTUAL_ENV/bin/activate
    fi
  '';
}
