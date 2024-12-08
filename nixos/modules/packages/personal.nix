{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # personal
    foliate
    shortwave

    # stremio
  ];
}
