{ pkgs, config, ... }: {
  fonts.packages = with pkgs; [
    noto-fonts-cjk
      noto-fonts-emoji
  ];

  stylix.fonts = {
    serif = config.stylix.fonts.sansSerif;

    sansSerif = config.stylix.fonts.monospace;

    monospace = { 
      package = pkgs.nerdfonts;
      name = "JetbrainsMono NF Semibold";
    };
    emoji = { 
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };
}
