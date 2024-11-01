{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      ".." = "cd ..";
    };

    initExtra = ''
      # Explicitly set HOME
      export HOME="${config.home.homeDirectory}"

      # Use \w for proper path display with tilde
      PS1='[\u@\h:\w]\$ '

      # Function for NixOS system cleaning
      clean-nix() {
        echo "Removing old system generations..."
        sudo nix-collect-garbage -d

        echo "Removing old user generations..."
        nix-collect-garbage -d

        echo "Running garbage collection..."
        sudo nix store gc

        echo "Optimizing store..."
        sudo nix store optimise

        echo "Rebuilding system..."
        sudo nixos-rebuild switch --flake ~/.dotfiles#nixos

        echo "Rebuilding home-manager configuration..."
        home-manager switch --flake ~/.dotfiles#adityainduraj

        echo "Cleaning complete!"
      }
    '';
  };

  # direnv configuration
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
}
