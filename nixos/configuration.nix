# .dotfiles/nixos/configuration.nix
{ config, pkgs, pkgs-unstable, ... }:

{
  imports = [
    ./hardware-configuration.nix

    # modules import
    ./modules/bluetooth.nix
    ./modules/gnome.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable Flatpak
  services.flatpak.enable = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  # Commented these lines are they are there in /modules/gnome.nix

  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # PipeWire Configuration
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  # Define a user account.
  users.users.adityainduraj = {
    isNormalUser = true;
    description = "Aditya Induraj";
    extraGroups = [ "networkmanager" "wheel" "audio" "bluetooth" ];
    home = "/home/adityainduraj";
    shell = pkgs.bash;  # Explicitly set bash as the shell
  };

  # Install Firefox
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # List packages installed in system profile
  environment.systemPackages = with pkgs; [
    # Basic utilities
    vim
    git
    gnome.gnome-keyring
    libsecret
    curl

    # GNOME packages -> moved to ./modules/gnome.nix
    # gnome.gnome-tweaks
    # gnome.gnome-bluetooth
    # gnome.gnome-settings-daemon
    # gnome.gnome-control-center

    (python3.withPackages(ps: with ps; [
        pip
        virtualenv
        tkinter
      ]))

    # Development
    vscode
    neovim
    direnv

    # NerdFont
    jetbrains-mono
    ibm-plex
    hack-font

    # Development and build essentials
    gcc
    gnumake
    autoconf
    automake
    libtool
    patch
    pkg-config

    # Theming
    papirus-icon-theme
    geist-font

    # Audio packages
    pavucontrol
    pulseaudio-ctl
    wireplumber
    alsa-utils

    pkgs.easyeffects
    pkgs.syncthing

    # Additional utilities
    psmisc  # For killall command
  ] ++ (with pkgs-unstable; [
    zed-editor
  ]);

  # Updated Syncthing configuration
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

  systemd.tmpfiles.rules = [
    "d /home/adityainduraj/Sync 0700 adityainduraj users -"
  ];
  # This value determines the NixOS release
  system.stateVersion = "24.05";
}
