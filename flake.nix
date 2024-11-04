{
  description = "The Galaxynix flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags.url = "github:Aylur/ags";
    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.1-1.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
     nh.url = "github:viperML/nh";
    nix-output-monitor.url = "github:maralorn/nix-output-monitor";
    comma.url = "github:nix-community/comma";
    schizofox.url = "github:schizofox/schizofox";
    };

  outputs = { self, nixpkgs, lix-module, nixvim, nh, nix-output-monitor, comma, ... }@inputs: {
    nixosConfigurations.andromeda = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
	./nixosModules
	  ./hardware-configuration.nix
	  inputs.home-manager.nixosModules.default
	  inputs.stylix.nixosModules.stylix
	  lix-module.nixosModules.default
      ];
    };
    nixosConfigurations.segue = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
	./nixosModules/systemConfig/config.nix
	  ./hardware-configuration.nix
	  inputs.home-manager.nixosModules.default
	  inputs.stylix.nixosModules.stylix
	  lix-module.nixosModules.default
      ];
    };
  };
}
