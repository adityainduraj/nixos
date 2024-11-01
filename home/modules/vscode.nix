{ config, pkgs, ... }:

{
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  programs.vscode = {
    enable = true;
    package = (pkgs.vscode.override {
      commandLineArgs = [
        "--enable-features=UseOzonePlatform,WaylandWindowDecorations"
        "--ozone-platform=wayland"
      ];
    });
  };
}
