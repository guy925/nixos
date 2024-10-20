{ pkgs, ... }:
{
  imports = [
    ./audio.nix
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
  ];
  environment.systemPackages = with pkgs; [
    wget
      distrobox
      polkit-kde-agent
      findutils
      newt
      playerctl
      killall
      starship
      tofi
      nil
      git
      kitty
      swww
      hyprshot
      hypridle
      terminus_font
      terminus_font_ttf
      grim
      slurp
      ripgrep
      wl-clipboard
      pfetch
      brightnessctl
      btop
      libnotify
      ];

}
