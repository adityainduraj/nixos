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

    # gnome apps
    # papers
  ];
}
