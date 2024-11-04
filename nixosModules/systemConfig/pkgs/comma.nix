{ pkgs, inputs, ... }:

{
  programs.comma = {
    enable = true;
#    package = inputs.comma;
  };
}
