{
  config,
  lib,
  pkgs,
  ...
}: {
  # Syncthing package
  environment.systemPackages = with pkgs; [
    syncthing
  ];

  # Syncthing service configuration
  services.syncthing = {
    enable = true;
    user = "adityainduraj";
    group = "users";
    dataDir = "/home/adityainduraj/Sync";
    configDir = "/home/adityainduraj/.config/syncthing";
    overrideDevices = false;
    overrideFolders = false;
    openDefaultPorts = true;
    systemService = true;
  };

  # Ensure Sync directory exists with correct permissions
  systemd.tmpfiles.rules = [
    "d /home/adityainduraj/Sync 0700 adityainduraj users -"
  ];
}
