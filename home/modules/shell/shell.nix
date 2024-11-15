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

        # System generations
        echo "Current system generations:"
        sudo nix-env -p /nix/var/nix/profiles/system --list-generations
        gen_count=$(sudo nix-env -p /nix/var/nix/profiles/system --list-generations | wc -l) || {
          echo "Error: Could not count system generations"
          return 1
        }

        echo -e "\nHow many system generations would you like to keep? [3]: "
        read KEEP_SYSTEM_INPUT
        KEEP_SYSTEM_GENERATIONS=''${KEEP_SYSTEM_INPUT:-3}

        # Validate system generations input
        if ! [[ "$KEEP_SYSTEM_GENERATIONS" =~ ^[0-9]+$ ]] || [ "$KEEP_SYSTEM_GENERATIONS" -lt 1 ]; then
          echo "Error: Invalid input. Using default value of 3 generations."
          KEEP_SYSTEM_GENERATIONS=3
        fi

        # Home-manager generations
        echo -e "\nCurrent home-manager generations:"
        home-manager generations
        hm_gen_count=$(home-manager generations | wc -l) || {
          echo "Error: Could not count home-manager generations"
          return 1
        }

        echo -e "\nHow many home-manager generations would you like to keep? [3]: "
        read KEEP_HM_INPUT
        KEEP_HM_GENERATIONS=''${KEEP_HM_INPUT:-3}

        # Validate home-manager generations input
        if ! [[ "$KEEP_HM_GENERATIONS" =~ ^[0-9]+$ ]] || [ "$KEEP_HM_GENERATIONS" -lt 1 ]; then
          echo "Error: Invalid input. Using default value of 3 generations."
          KEEP_HM_GENERATIONS=3
        fi

        echo -e "\nWill keep:"
        echo "System generations: $KEEP_SYSTEM_GENERATIONS"
        echo "Home-manager generations: $KEEP_HM_GENERATIONS"

        # System generations cleanup
        if [ "$gen_count" -lt "$KEEP_SYSTEM_GENERATIONS" ]; then
          echo -e "\nWarning: Only $gen_count system generation(s) present. Skipping system cleanup."
        else
          echo -e "\nFound $gen_count system generations. Safe to proceed with cleanup."
          echo "Removing old system generations..."
          sudo nix-env -p /nix/var/nix/profiles/system --delete-generations +$KEEP_SYSTEM_GENERATIONS || {
            echo "Error: Failed to clean system generations"
            return 1
          }
        fi

        # Home-manager generations cleanup
        if [ "$hm_gen_count" -lt "$KEEP_HM_GENERATIONS" ]; then
          echo -e "\nWarning: Only $hm_gen_count home-manager generation(s) present. Skipping home-manager cleanup."
        else
          echo -e "\nFound $hm_gen_count home-manager generations. Safe to proceed with cleanup."
          echo "Removing old home-manager generations..."
          generations_to_remove=$(home-manager generations | awk -v keep="$KEEP_HM_GENERATIONS" 'NR > keep {print $5}' | tr -d ':' | tac)
          for gen_id in $generations_to_remove; do
            home-manager remove-generations "$gen_id" || echo "Warning: Failed to remove generation $gen_id"
          done
        fi

        # User generations cleanup
        echo -e "\nRemoving old user generations..."
        nix-env --delete-generations +$KEEP_SYSTEM_GENERATIONS || {
          echo "Error: Failed to clean user generations"
          return 1
        }

        # Clean temporary files
        echo -e "\nCleaning temporary files..."
        sudo rm -rf /tmp/* /var/tmp/* || echo "Warning: Some temporary files could not be removed"

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

        echo "Verifying store integrity..."
        sudo nix-store --verify --check-contents || echo "Warning: Store verification found issues"

        echo "Updating bootloader entries..."
        sudo /run/current-system/bin/switch-to-configuration boot || echo "Warning: Failed to update bootloader entries"

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

        # Show final generation counts
        final_sys_count=$(sudo nix-env -p /nix/var/nix/profiles/system --list-generations | wc -l)
        final_hm_count=$(home-manager generations | wc -l)
        echo -e "\nFinal generation counts:"
        echo "System generations: $final_sys_count"
        echo "Home-manager generations: $final_hm_count"
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
