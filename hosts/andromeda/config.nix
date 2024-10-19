{
	imports =
		[
		./../../nixosModules
		];
	nvidia.enable = true;
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

	networking.hostName = "andromeda"; # Define your hostname.

	# Allow Nonfree Software
	nixpkgs.config.allowUnfree = true;

	networking.networkmanager.enable = true;

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	services.xserver.xkb = {
  		layout = "us";
  		variant = "";
	};
	
	system.stateVersion = "24.05"; 

}
