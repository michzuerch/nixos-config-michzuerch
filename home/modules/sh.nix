{pkgs, ...}: {
  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
    };

    bat = {
      enable = true;
      config = {
        pager = "less -FR";
      };
      extraPackages = with pkgs.bat-extras; [
        batman
        batpipe
        batgrep
        batdiff
      ];
    };
    fd = {
      enable = true;
    };

    fzf = {
      enable = true;
      defaultCommand = "fd --type f --hidden --no-ignore --follow --exclude .git";
      enableZshIntegration = true;
      enableFishIntegration = false;
    };

    jq.enable = true;

    broot = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    };

    dircolors.enable = true;

    direnv = {
      enable = true;
      silent = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    eza = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
      colors = "always";
      git = true;
      icons = "always";
      extraOptions = [
        "--group-directories-first"
        "--header"
      ];
    };
    tealdeer = {
      enable = true;
      enableAutoUpdates = true;

      settings = {
        display = {
          compact = false;
          use_pager = true;
        };
      };
    };
    pandoc.enable = true;
  };

  home.packages = with pkgs; [
    bandwhich
    chatgpt-cli
    cowsay
    flake-checker
    dust
    doggo
    dysk
    gping
    just
    nethogs
    nix-output-monitor
    hydra-check
    nix-init
    nix-melt
    nix-tree
    nix-health
    gcc
    gnumake
    grex
    gtop
    krusader
    ncdu
    procs
    pwgen
    sd
    sqlite
    tig
    trash-cli
    p7zip
    tokei
    unzip
    zoxide
  ];
}
