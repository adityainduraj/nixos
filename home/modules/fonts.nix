{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Your fonts here
  ];

  fonts.fontconfig.enable = true;
}
