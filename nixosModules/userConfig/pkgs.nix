{ pkgs, ... }:

{
  home.packages = [
      pkgs.localsend
      pkgs.firefox
      pkgs.fastfetch
      pkgs.gnome-themes-extra
    ];
}
