{ inputs, config, pkgs, ... }:

{
	imports =
		[
		./../../modules/connect.nix
		];
	nvidia.enable = false;
	boot.loader = {
		efi = {
			canTouchEfiVariables = true;
		};
		grub = {
			enable = true;
			efiSupport = true;
			device = "nodev";
		};
	};

	networking.hostName = "segue"; # Define your hostname.

	networking.networkmanager.enable = true;

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	services.xserver.xkb = {
  		layout = "us";
  		variant = "";
	};
	
	system.stateVersion = "24.05"; 

}
