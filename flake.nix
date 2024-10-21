{
  description = "Nixos config flake";

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
 };

  outputs = { self, nixpkgs, nixvim, ... }@inputs: {
    nixosConfigurations.andromeda = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
	./hosts/andromeda/config.nix
	  ./hardware-configuration.nix
	  inputs.home-manager.nixosModules.default
	  inputs.stylix.nixosModules.stylix
      ];
    };
    nixosConfigurations.segue = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
	./hosts/segue/config.nix
	  ./hardware-configuration.nix
	  inputs.home-manager.nixosModules.default
	  inputs.stylix.nixosModules.stylix
      ];
    };
  };
}
