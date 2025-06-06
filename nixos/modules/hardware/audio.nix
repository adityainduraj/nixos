{
  config,
  pkgs,
  ...
}: {
  security.rtkit.enable = true;
  hardware.pulseaudio.enable = false;

  # VERIFY IF THESE WORK WITH YOUR AUDIO HARDWARE
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  environment.systemPackages = with pkgs; [
    pavucontrol
    pulseaudio-ctl
    wireplumber
    alsa-utils
    easyeffects
  ];
}
