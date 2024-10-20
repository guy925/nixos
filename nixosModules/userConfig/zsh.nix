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
      upd = "sudo nixos-rebuild switch";
    };

    history = {
      size = 999999;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    initExtraFirst = "pfetch;PROMPT=\"%F{blue}┌┤%f%B%F{cyan}%n%f%b%F{yellow}@%f%F{magenta}%m%f%F{blue}│\"$'\n'\"%F{blue}└ %~   %B%F{green}->%b \"; RPROMPT=\"%F{blue}%W-%t\"";
# Make ZSH start faster
    completionInit = "compinit";
  };
}
