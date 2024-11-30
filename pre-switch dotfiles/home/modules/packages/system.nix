{pkgs, ...}: {
  home.packages = with pkgs; [
    tree
    fastfetch

    # for page up and down keymaps
  ];
}
