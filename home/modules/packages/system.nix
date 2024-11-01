{ pkgs, ... }: {
  home.packages = with pkgs; [
    tree
    fastfetch
    neofetch
  ];
}
