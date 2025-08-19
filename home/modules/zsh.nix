{config, ...}: {
  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    dotDir = ".config/zsh";
    shellAliases = {
      ll = "ls -l";
      # update = "sudo nixos-rebuild switch";
    };
    history = {
      size = 10000;
      save = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
      ignoreAllDups = true;
      ignoreSpace = true;
      expireDuplicatesFirst = true;
      share = true;
      extended = true;
    };
  };
}
