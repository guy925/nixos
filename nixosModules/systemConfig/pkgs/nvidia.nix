{ lib, config, ... }: {
  options = {
    nvidia.enable = 
      lib.mkEnableOption "enables nvidia drivers";
  };
  config = lib.mkIf config.nvidia.enable {
    boot.kernelParams = [
      "nvidia_drm.fbdev=1"
    ];
    hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.production;
    hardware.graphics = {
      enable = true;
    };
    services.xserver.videoDrivers = ["nvidia"];

    hardware.nvidia = {

      modesetting.enable = true;
      powerManagement.enable = false;

      powerManagement.finegrained = false;

      open = false;

      nvidiaSettings = true;

    };
  };
}
