{
  config,
  pkgs-unstable,
  ...
}: {
  environment.systemPackages = with pkgs-unstable; [
    neovim
    xclip

    # theming
    papirus-icon-theme
    geist-font
    texlivePackages.cm

    # cursors
    # pkgs.google-cursor

    # gnome apps
    # papers
  ];
}
