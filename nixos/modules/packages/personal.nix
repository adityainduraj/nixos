{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # personal
    foliate
    shortwave

    # hackathon ctf related
    burpsuite
    wireshark-qt
    ghidra-bin
    nix-ld
  ];
}
