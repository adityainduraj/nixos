2. **Create a `flake.nix` File**

   In your project directory, create a `flake.nix` file to define your project and its dependencies:

   ```nix
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
   ```

   This `flake.nix` file defines a development shell that includes the dependencies specified in your `pyproject.toml` file using `poetry2nix`.

#### 4. **Managing Python Dependencies with Poetry and Poetry2nix**

`poetry` is a dependency manager for Python that provides a simple way to manage project dependencies and virtual environments. `poetry2nix` integrates `poetry` with Nix, allowing you to manage Python dependencies declaratively.

1. **Install Poetry**

   Ensure `poetry` is installed:

   ```sh
   nix-env -iA nixpkgs.poetry
   ```

2. **Create a `pyproject.toml` File**

   Define your project dependencies in a `pyproject.toml` file:

   ```toml
   [tool.poetry]
   name = "my_project"
   version = "0.1.0"
   description = ""
   authors = ["Your Name <you@example.com>"]

   [tool.poetry.dependencies]
   python = "^3.10"
   requests = "^2.26.0"
   numpy = "^1.21.2"

   [build-system]
   requires = ["poetry-core>=1.0.0"]
   build-backend = "poetry.core.masonry.api"
   ```

3. **Generate a `poetry.lock` File**

   Run the following command to generate a `poetry.lock` file:

   ```sh
   poetry lock
   ```

4. **Create a `default.nix` File**

   Create a `default.nix` file to use `poetry2nix`:

   ```nix
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
   ```

5. **Enter the Nix Shell**

   Run the following command to enter the Nix shell with the `poetry` environment:

   ```sh
   nix-shell
   ```

   This will create and activate the virtual environment, installing the dependencies defined in `pyproject.toml`.

#### 5. **Using `direnv` for Automatic Environment Activation**

`direnv` can automatically load and unload environment variables based on the directory you are in. This is particularly useful for managing multiple projects with different environments.

1. **Install `direnv` and `nix-direnv`**

   Ensure `direnv` and `nix-direnv` are installed and enabled in your NixOS configuration:

   ```nix
   programs.direnv = {
     enable = true;
     nix-direnv.enable = true;
     enableBashIntegration = true;
     enableZshIntegration = true;
   };
   ```

2. **Create a `.envrc` File**

   In your project directory, create a `.envrc` file that loads the `flake.nix` environment:

   ```sh
   use flake
   ```

3. **Allow the `.envrc` File**

   Run the following command to allow the `.envrc` file:

   ```sh
   direnv allow
   ```

   Now, whenever you enter the project directory, `direnv` will automatically load the Nix environment defined in `flake.nix`.
