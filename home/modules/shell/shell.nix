{
  config,
  pkgs,
  ...
}: {
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      ".." = "cd ..";
      nix-system-generations = "sudo nix-env -p /nix/var/nix/profiles/system --list-generations";
      nixupdate = "sudo nixos-rebuild switch --flake ~/.dotfiles#nixos";
      hmupdate = "home-manager switch --flake ~/.dotfiles#adityainduraj";
      nixclean = "clean-nix";
    };

    initExtra = ''
      # Explicitly set HOME
      export HOME="${config.home.homeDirectory}"

      # Use \w for proper path display with tilde
      PS1='[\u@\h:\w]\$ '

      # Function for NixOS system cleaning
      clean-nix() {
        # Get the system profile path
        system_profile="/nix/var/nix/profiles/system"

        # Check current number of generations with more explicit counting
        gen_count=$(ls -l "$system_profile"-*-link 2>/dev/null | wc -l) || {
          echo "Error: Could not count generations"
          return 1
        }

        echo "Current system generations: $gen_count"

        if [ "$gen_count" -lt 3 ]; then
          echo "Warning: Only $gen_count generation(s) present. Skipping cleanup to maintain system stability."
          echo "Proceeding directly to rebuild..."
        else
          echo "Found $gen_count generations. Safe to proceed with cleanup."

          # Keep the latest 3 generations by deleting older ones
          echo "Removing old system generations..."
          sudo nix-env -p /nix/var/nix/profiles/system --delete-generations +3 || {
            echo "Error: Failed to clean system generations"
            return 1
          }

          echo "Removing old user generations..."
          nix-env --delete-generations +3 || {
            echo "Error: Failed to clean user generations"
            return 1
          }

          echo "Running garbage collection..."
          sudo nix store gc || {
            echo "Error: Failed to run garbage collection"
            return 1
          }

          echo "Optimizing store..."
          sudo nix store optimise || {
            echo "Error: Failed to optimize store"
            return 1
          }
        fi

        echo "Rebuilding system..."
        sudo nixos-rebuild switch --flake ~/.dotfiles#nixos || {
          echo "Error: System rebuild failed"
          return 1
        }

        echo "Rebuilding home-manager configuration..."
        home-manager switch --flake ~/.dotfiles#adityainduraj || {
          echo "Error: Home-manager rebuild failed"
          return 1
        }

        # Show final generation count
        final_gen_count=$(ls -l "$system_profile"-*-link 2>/dev/null | wc -l)
        echo "Final system generations: $final_gen_count"
        echo "Process complete!"
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
