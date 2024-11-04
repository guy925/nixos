{ pkgs, config, lib, ... }:
{

  options = {
    style = {
      theme = lib.mkOption { type = lib.types.str; };
    };
  };
  config = {
    stylix = {
      enable = true;
      image = ./../../userConfig/files/wall.png;
      base16Scheme = ./blueberry.yaml;
      targets = {
	regreet.enable = true;
      };      
      cursor = {
	package = pkgs.bibata-cursors;
	name = "Bibata-Modern-Classic";
	size = 24;
      };
    };
  };
}
