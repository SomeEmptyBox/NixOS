{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    brightnessctl
    clipse
    hyprshot
    libreoffice-fresh
    nautilus
    protonvpn-gui
    superfile
    telegram-desktop
    kdePackages.dolphin
    kdePackages.dolphin-plugins
    kdePackages.qt6ct
    kdePackages.qtwayland
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
    qbittorrent
    webcord
    wl-clipboard
    zsh-powerlevel10k
  ];
}
