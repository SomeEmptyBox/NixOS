{ config, lib, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBarinsMonoNerdFont";
      size = 11;
    };
  };
}
