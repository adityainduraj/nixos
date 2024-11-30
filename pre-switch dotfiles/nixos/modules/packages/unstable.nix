{
  config,
  pkgs-unstable,
  ...
}: {
  environment.systemPackages = with pkgs-unstable; [
    zed-editor
    neovim
    xclip

    # theming
    papirus-icon-theme
    geist-font

    # gnome apps 
    # papers
  ];
}
