{ config, pkgs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ./packages.nix
      ./intel-drivers.nix
      ./modules/bundle.nix
      ./disko-config.nix
    ];
  
  disabledModules = [
      ./modules/xserver.nix
  ];

  # Define your hostname. 
  networking.hostName = "BathyScarfOS";

  # Set your time zone.
  time.timeZone = "Asia/Tokyo";

  # Select internationalisation properties.
  i18n.defaultLocale = "ja_JP.UTF-8";
  i18n.extraLocaleSettings = {
      LC_ADDRESS = "ja_JP.UTF-8";
      LC_IDENTIFICATION = "ja_JP.UTF-8";
      LC_MEASUREMENT = "ja_JP.UTF-8";
      LC_MONETARY = "ja_JP.UTF-8";
      LC_NAME = "ja_JP.UTF-8";
      LC_NUMERIC = "ja_JP.UTF-8";
      LC_PAPER = "ja_JP.UTF-8";
      LC_TELEPHONE = "ja_JP.UTF-8";
      LC_TIME = "ja_JP.UTF-8";
    };

  # Japanese input.
  i18n.inputMethod = {
   enabled = "fcitx5";
   fcitx5.addons = with pkgs; [
     fcitx5-mozc
   ];
  };

# Power management.
  powerManagement = {
	  enable = true;
  }; 

  # flatpak
  services.flatpak.enable = true;

  # Automatic Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

 # OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Enableing flakes and optimize store.
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  # Set system version.
  system.stateVersion = "23.11";
}
