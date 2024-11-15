{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    vim
    git
    gnome.gnome-keyring
    libsecret
    curl
    psmisc

    # Workspace

    # Fonts
    jetbrains-mono
    ibm-plex
    hack-font
    # geist-font -> moved to unstable

    # Theming
    # papirus-icon-theme -> moved to unstable
    adw-gtk3
  ];

  # Enable Firefox
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
