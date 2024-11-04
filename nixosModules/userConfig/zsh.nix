{ config, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    autosuggestion.strategy = [ "completion" ];
    syntaxHighlighting.enable = true;

    shellAliases = {
# Navigation
      l = "ls --color=auto";
      la = "ls -a --color=auto";
      ll = "ls -l --color=auto";
      lal = "ls -l -a --color=auto";
      c = "cd";
# NixOS
      nixconf = "cd /etc/nixos";
      upd = "nh os switch";
# Japanese
      "さよなら" = "sudo poweroff";
      "ひと" = "man";
      "人" = "man";
      "じゃあね" = "systemctl suspend";
    };

    history = {
      size = 999999;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    initExtraFirst = "fastfetch
      ,() nix run nixpkgs#$1 -- $(echo \$argv|sed \"s/$1//g\")
      precmd() {
	if [[ $? != 0 ]]
	then
	  PROMPT=\"%F{blue}┌┤%f%B%F{cyan}%n%f%b%F{yellow}@%f%F{magenta}%m%f%F{blue}│\"$'\n'\"%F{blue}└ %~ ツ %B%F{red}->%b \"
	else
	  PROMPT=\"%F{blue}┌┤%f%B%F{cyan}%n%f%b%F{yellow}@%f%F{magenta}%m%f%F{blue}│\"$'\n'\"%F{blue}└ %~ ツ %B%F{green}->%b \"
	fi
      }
    RPROMPT=\"%F{blue}%W-%t\"
      ";
# Make ZSH start faster
    completionInit = "compinit";
  };
}
