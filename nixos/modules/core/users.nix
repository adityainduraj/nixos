{
  config,
  pkgs,
  ...
}: {

  # Define necessary groups
  users.groups = {
    libvirt = {};
    kvm = {};
  };

  users.users.adityainduraj = {
    isNormalUser = true;
    description = "Aditya Induraj";
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "bluetooth"
      "fprintd"
      "libvirt"
      "kvm"
    ];
    home = "/home/adityainduraj";
    shell = pkgs.bash;
  };
}
