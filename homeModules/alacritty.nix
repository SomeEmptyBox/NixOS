{ config, lib, pkgs, ... }:

{
  programs.alacritty.enable = true;
  programs.alacritty.settings = {

    #shell = "/share/zsh";
    #args = ["-l"];

    window = {
      padding = { x = 5; y = 5; };
      dynamic_padding = true;
    };

    font = {
      normal = { family = "JetBrainsMonoNerdFont"; style = "Bold"; };
      size = 10.0;
    };

  };
}
