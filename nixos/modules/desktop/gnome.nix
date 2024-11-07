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
    gnome.gnome-tweaks
    gnome.gnome-bluetooth
    gnome.gnome-settings-daemon
    gnome.gnome-control-center
  ];
}
