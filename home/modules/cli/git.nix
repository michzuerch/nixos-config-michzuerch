{pkgs, ...}: {
  programs = {
    delta = {
      enable = true;
      enableGitIntegration = true;
      enableJujutsuIntegration = true;
      options = {
        navigate = true;
        line-numbers = true;
      };
    };
    git = {
      package = pkgs.gitFull;
      enable = true;
      settings = {
        user = {
          name = "Michael Zuercher";
          email = "michzuerch@gmail.com";
          init.defaultBranch = "main";
          branch.autosetuprebase = "always";
          color.ui = true;
          core = {
            editor = "nvim";
            symlinks = "false";
            askPass = ""; # needs to be empty to use terminal for ask pass
          };
          #credential.helper = "libsecret"; # want to make this more secure
          credential.helper = "${pkgs.git.override {withLibsecret = true;}}/bin/git-credential-libsecret";
          github.user = "michzuerch";
          pull.rebase = true;
          push = {
            default = "tracking";
            autoSetupRemote = true;
          };
        };
        aliases = {
          cleanup = "!git branch --merged | grep  -v '\\*\\|master\\|develop' | xargs -n 1 -r git branch -d";
          prettylog = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(r) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
          root = "rev-parse --show-toplevel";
          ci = "commit";
          co = "checkout";
          s = "status";
        };
      };
      ignores = [
        ".cache/"
        ".DS_Store"
        ".idea/"
        "*~"
        "*.swp"
        "*.elc"
        "auto-save-list"
        ".envrc"
        ".direnv/"
        "node_modules"
        "result"
        "result-*"
      ];
      lfs.enable = true;
    };
    gitui = {
      enable = true;
      package = pkgs.gitui;
    };
    lazygit = {
      enable = true;
      settings = {
        disableStartupPopups = true;
        notARepository = "skip";
        promptToReturnFromSubprocess = false;
        update.method = "never";
        git = {
          commit.signOff = true;
          overrideGpg = true;
          parseEmoji = true;
        };
        gui = {
          showIcons = true;
          theme = {
            activeBorderColor = ["green" "bold"];
            inactiveBorderColor = ["grey"];
            selectedLineBgColor = ["blue"];
          };
          showListFooter = false;
          showRandomTip = false;
          showCommandLog = false;
          showBottomLine = false;
          nerdFontsVersion = "3";
        };
      };
    };
  };
  #services = {
  #  git-sync = {
  #    enable = true;
  #    package = pkgs.git-sync;
  #  };
  #};
  home.packages = with pkgs; [act github-desktop github-runner];
}
