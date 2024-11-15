{pkgs, ...}: {
  home.packages = with pkgs; [
    tree
    fastfetch
    neofetch

    # for page up and down keymaps
    xdotool
  ];
}
