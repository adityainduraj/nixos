{ config, pkgs, ... }:

{
  # Enable Flatpak
  services.flatpak.enable = true;

  # Add flathub repository (you only need to do this once)
  systemd.services.configure-flathub = {
    description = "Configure Flathub repository";
    wantedBy = [ "multi-user.target" ];
    serviceConfig.Type = "oneshot";
    script = ''
      ${pkgs.flatpak}/bin/flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

  # Add required packages
  environment.systemPackages = with pkgs; [
    flatpak
    gnome.gnome-software # Optional: If you want GNOME Software integration
  ];
}
