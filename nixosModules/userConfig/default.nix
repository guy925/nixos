{ inputs, ... }:

{
  imports = [
    ./btop.nix
      ./env.nix
      ./files.nix
      ./hyprland.nix
      ./ags.nix
      ./kitty.nix
      ./pkgs.nix
      ./firefox.nix
      ./tofi.nix
      ./vim.nix
      ./zsh.nix
      ./fileman.nix
      inputs.nixvim.homeManagerModules.nixvim 
  ];
  home.username = "guy";
  home.homeDirectory = "/home/guy";
  home.stateVersion = "23.11"; # Please read the comment before changing.
# Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}
