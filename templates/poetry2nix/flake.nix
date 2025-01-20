   {
     description = "My Nix Flake Project";

     inputs = {
       nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
       poetry2nix.url = "github:nix-community/poetry2nix";
     };

     outputs = { self, nixpkgs, poetry2nix }:
     let
       system = "x86_64-linux";
       pkgs = import nixpkgs { inherit system; };
     in {
       devShells.default = pkgs.mkShell {
         buildInputs = [
           poetry2nix.mkPoetryEnv {
             projectDir = ./.;
           }
         ];
       };
     };
   }
