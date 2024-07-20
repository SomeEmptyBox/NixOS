{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  zramSwap.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
    
  services = {
    libinput.enable = true;
    udisks2.enable = true;

    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      package = pkgs.kdePackages.sddm;
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
    };
  };

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "nixos"; # Define your hostname.
    networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  };

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  #console = {
  #  font = "JetBrainsMono";
  #  keyMap = "us";
  #  useXkbConfig = true; # use xkb.options in tty.
  #};

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.peace = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "NetworkManager" "wheel" ]; # Enable ‘sudo’ for the user.
  };

  programs = {
    hyprland.enable = true;
    zsh.enable = true;
  };

  environment.systemPackages = with pkgs; [
    android-tools
    btop
    curl
    git
    neovim
    sbctl
    tlrc
    unzip
    wget
    winePackages.waylandFull
  ];

  system.stateVersion = "24.05"; # Did you read the comment?

}
