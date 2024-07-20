{ config, lib, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.peace = {
      name = "peace";
      search = {
        default = "DuckDuckGo";
	engines = {
	  
	  "Bing".metaData.hidden = true;
	  "Google".metaData.hidden = true;

	  "Home Manager" = {
	    urls = [{ 
	      template = "https://home-manager-options.extranix.com/";
	      params = [{ name = "query"; value = "{searchTerms}"; }];
	    }];
	    definedAliases = [ "hm" ];
	  };

	  "Nix Packages" = {
	    urls = [{
	      template = "https://search.nixos.org/packages";
	      params = [
	        { name = "channel"; value = "unstable"; }
	        { name = "type"; value = "packages"; }
		{ name = "query"; value = "{searchTerms}"; }
	      ];
	    }];
	    definedAliases = [ "np" ];
	  };

	  "Nix Options" = {
	    urls = [{
	      template = "https://search.nixos.org/options";
	      params = [
	        { name = "channel"; value = "unstable"; }
	        { name = "type"; value = "packages"; }
		{ name = "query"; value = "{searchTerms}"; }
	      ];
	    }];
	    definedAliases = [ "no" ];
	  };

	};
      };

    };
  };
}
