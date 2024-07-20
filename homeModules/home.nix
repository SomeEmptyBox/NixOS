{ config, lib, pkgs, inputs, ... }:

{
  #imports = [ ./homeModules/default.nix ];

  home = {
    username = "peace";
    homeDirectory = "/home/peace";
    stateVersion = "24.05";
    
    pointerCursor = {
      gtk.enable = true;
      name = "Bibata-Modern-Classic";
      size = 20;
      package = pkgs.bibata-cursors;
    };

    sessionVariables = {
      EDITOR = "nvim";
      NIXOS_OZONE_WL = 1;
    };
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  catppuccin = {
    enable = true;
    accent = "blue";
    flavor = "mocha";
    pointerCursor.enable = false;
  };

  fonts.fontconfig.enable = true;

  services = {
    dunst.enable = true;
    kdeconnect.enable = true;
    network-manager-applet.enable = true;
    udiskie.enable = true;
  };

  qt = {
    enable = true;
    style.name = "kvantum";
    platformTheme.name = "kvantum";
  };

  gtk = {
    enable = true;
    catppuccin = {
      enable = true;
      icon.enable = true;
    };
  };

  programs = {
    btop.enable = true;
    home-manager.enable = true;
    imv.enable = true;
    neovim.enable = true;
    rofi = {
      enable = true;
      font = "JetBrainsMonoNerdFont";
      package = pkgs.rofi-wayland;
    };
  };
}
