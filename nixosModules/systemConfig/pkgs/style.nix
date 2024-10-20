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
	grub.useImage = true;
      };      fonts = {
	serif = config.stylix.fonts.sansSerif;

	sansSerif = config.stylix.fonts.monospace;

	monospace = {
	  package = pkgs.nerdfonts;
	  name = "JetbrainsMono NF Semibold";
	};

	emoji = {
	  package = pkgs.noto-fonts-emoji;
	  name = "Noto Color Emoji";
	};
      };
      cursor = {
	package = pkgs.bibata-cursors;
	name = "Bibata-Modern-Classic";
	size = 24;
      };
    };
  };
}
