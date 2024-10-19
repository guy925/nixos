{ inputs, pkgs, ... }:

{
# add the home manager module
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;

    configDir = ./files/ags;

    extraPackages = with pkgs; [
      gtksourceview
	webkitgtk
	accountsservice
    ];
  };
}
