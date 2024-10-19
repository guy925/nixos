{ pkgs, ... }:
{
	programs.hyprland.enable = true;
	xdg.portal.enable = true;
	xdg.portal.extraPortals = with pkgs; [
	  xdg-desktop-portal-hyprland
	    xdg-desktop-portal-gtk
	];

}
