{ inputs, ... }:
{
  stylix.targets.firefox.profileNames = [ "guy" ];
  programs.firefox = {
    enable = true;
    profiles.guy = {
      extensions = [
	inputs.firefox-addons.packages."x86_64-linux".ublock-origin
	inputs.firefox-addons.packages."x86_64-linux".vimium
      ];
    };
  };
}
