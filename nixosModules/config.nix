{
  user.username = "guy";
  user.password = "deena2";
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
	nvidia.enable = true;

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	services.xserver.xkb = {
  		layout = "us";
  		variant = "";
	};
	 nix.settings = {
	   substituters = ["https://hyprland.cachix.org"];
	   trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
	 };
	system.stateVersion = "24.05"; 
}
