{ config, pkgs, ... }:

{
  users.users.adityainduraj = {
    isNormalUser = true;
    description = "Aditya Induraj";
    extraGroups = [ "networkmanager" "wheel" "audio" "bluetooth" ];
    home = "/home/adityainduraj";
    shell = pkgs.bash;
  };
}
