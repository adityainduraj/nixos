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
    # burpsuite
    # wireshark-qt
    # ghidra-bin
    nix-ld
    # binwalk
    file
    # veracrypt
    # stegsolve
    # zsteg
    # stegseek
    # cryptsetup
    # foremost
    # scalpel
    # dislocker
    # dosbox
  ];
}
