{ pkgs, config, ... }:

{
  boot = {

    plymouth = {
      enable = true;
    };
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
	"splash"
	"boot.shell_on_fail"
	"loglevel=3"
	"rd.systemd.show_status=false"
	"rd.udev.log_level=3"
	"udev.log_priority=3"
	"panic=1"
    ];
  };
  services.greetd.enable = true;
  programs.regreet.enable = true;
  }
