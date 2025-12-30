{config, ...}: {
  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    defaultKeymap = "viins";
    history = {
      size = 10000;
      ignoreAllDups = true;
      path = "${config.home.homeDirectory}/.config/.zsh/zsh_history";
    };

    # DotDir
    dotDir = "${config.home.homeDirectory}/.config/.zsh";

    shellAliases = {
      # ll = "ls -l";
    };
    # history = {
    #   size = 10000;
    #   save = 10000;
    #   ignoreAllDups = true;
    #   ignoreSpace = true;
    #   expireDuplicatesFirst = true;
    #   share = true;
    #   extended = true;
    # };
  };
}
