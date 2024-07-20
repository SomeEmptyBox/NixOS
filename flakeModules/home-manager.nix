{ config, lib, pkgs, inputs, ... }:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = {inherit inputs;};
    users.peace.imports = [
      ../homeModules/default.nix
      inputs.catppuccin.homeManagerModules.catppuccin
    ];
  };
}
