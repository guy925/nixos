{ lib, config, pkgs, ... } :

{
  options = {
    user.username = lib.mkOption {
      default = "guy";
      description = ''username'';
    };
    user.password = lib.mkOption {
      default = "deena2";
      description = ''password'';
    };
  };
  config = {
    users.users."${config.user.username}" = {
      isNormalUser = true;
      extraGroups = [ "wheel" "video" ];
      initialPassword = "${config.user.password}";
      description = "main user";
      shell = pkgs.zsh;
    };
  };
}
