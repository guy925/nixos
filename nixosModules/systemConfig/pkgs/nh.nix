{ inputs, ... }:

{
  programs.nh = {
    enable = true;
    package = inputs.nh.packages.x86_64-linux.default;
    flake = "/etc/nixos";
  };
}
