{ pkgs, ... }:
{
  imports = [
    ./audio.nix
      ./waydroid.nix
      ./nh.nix
      ./keys.nix
      ./fonts.nix
      ./nvidia.nix
      ./hyprland.nix
      ./printing.nix
      ./touchpad.nix
      ./boot.nix
      ./fileman.nix
      ./nvim.nix
      ./ssh.nix
      ./vim.nix
      ./zsh.nix
      ./style.nix
      ./podman.nix
      ./sudo.nix
  ];
  environment.systemPackages = [
    pkgs.wget
      pkgs.noto-fonts-cjk-sans
      pkgs.home-manager
      pkgs.distrobox
      pkgs.polkit-kde-agent
      pkgs.findutils
      pkgs.newt
      pkgs.playerctl
      pkgs.killall
      pkgs.starship
      pkgs.tofi
      pkgs.nil
      pkgs.git
      pkgs.kitty
      pkgs.swww
      pkgs.hyprshot
      pkgs.hypridle
      pkgs.grim
      pkgs.slurp
      pkgs.ripgrep
      pkgs.wl-clipboard
      pkgs.brightnessctl
      pkgs.btop
      pkgs.libnotify
      ];
}
