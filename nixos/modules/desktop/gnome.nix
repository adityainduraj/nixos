{
  config,
  pkgs,
  ...
}: {
  # Basic GNOME settings
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # GNOME Settings via dconf
  services.xserver.desktopManager.gnome = {
    extraGSettingsOverrides = ''
      [org.gnome.desktop.notifications]
      show-banners=false

      # You can add more GNOME settings here in the future
    '';
  };

  # GNOME-specific packages
  environment.systemPackages = with pkgs; [
    gnome-tweaks
    gnome-bluetooth
    gnome-settings-daemon
    gnome-control-center
  ];
}
