{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    vim
    git
    gnome-keyring
    libsecret
    curl
    psmisc

    #essentials
    wget

    #vm
    gnome-boxes

    # Workspace
    # libreoffice-fresh

    # Fonts
    # jetbrains-mono
    # ibm-plex
    # hack-font
    # geist-font -> moved to unstable

    # Theming
    # papirus-icon-theme -> moved to unstable
    adw-gtk3

    # Cursors
    # phinger-cursors
  ];

  # Enable Firefox
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
