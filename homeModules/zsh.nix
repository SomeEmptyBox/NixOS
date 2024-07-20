{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initExtraFirst = "
      source ~/.p10k.zsh \n
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
    ";
    
    shellAliases = {
      e = "$EDITOR";
      ll = "ls -l";

      nfu = "nix flake update ~/NixOS/.";
      ncg = "sudo nix-collect-garbage -d";
      nrs = "sudo nixos-rebuild switch --flake ~/NixOS/.";

      nmd = "cd ~/NixOS/nixosModules";
      fmd = "cd ~/NixOS/flakeModules";
      hmd = "cd ~/NixOS/homeModules"; 
      wpd = "cd ~/NixOS/wallpapers";
    };
  };
}
