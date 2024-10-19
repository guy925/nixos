{ pkgs, ... }:

{
  home.packages = [
      pkgs.localsend
      pkgs.gnome-themes-extra
    ];
}
