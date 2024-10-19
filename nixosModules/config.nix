{ lib, config, ... }:

{
imports = [
    ./systemConfig/users.nix
    ./systemConfig/pkgs/nvidia.nix
    ];
 user.username = "guy";
 user.password = "deena2";
 nvidia.enable = true;
 style.theme = "nord";
}
