# needs dependencies to be declared in pyproject.toml

{ pkgs ? import <nixpkgs> {} }:

   pkgs.mkShell {
     buildInputs = [
       pkgs.poetry2nix.mkPoetryEnv {
         projectDir = ./.;
       }
     ];

     shellHook = ''
       export VIRTUAL_ENV=$PWD/.venv
       export PATH=$VIRTUAL_ENV/bin:$PATH
       if [ ! -d "$VIRTUAL_ENV" ]; then
         virtualenv $VIRTUAL_ENV
         source $VIRTUAL_ENV/bin/activate
         poetry install
       else
         source $VIRTUAL_ENV/bin/activate
       fi
     '';
   }
