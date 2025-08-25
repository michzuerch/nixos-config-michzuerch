{pkgs, ...}: {
  programs = {
    git = {
      package = pkgs.gitAndTools.gitFull;
      enable = true;
      userName = "Michael Zuercher";
      userEmail = "michzuerch@gmail.com";
      delta = {
        enable = true;
        options = {
          navigate = true;
          line-numbers = true;
        };
      };
      lfs.enable = true;
      aliases = {
        cleanup = "!git branch --merged | grep  -v '\\*\\|master\\|develop' | xargs -n 1 -r git branch -d";
        prettylog = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(r) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
        root = "rev-parse --show-toplevel";
      };
      ignores = [
        ".envrc"
        ".direnv/"
        "*~"
        "*.swp"
      ];
      extraConfig = {
        init.defaultBranch = "main";
        branch.autosetuprebase = "always";
        color.ui = true;
        core = {
          editor = "nvim";
          symlinks = "false";
          askPass = ""; # needs to be empty to use terminal for ask pass
        };
        credential.helper = "libsecret"; # want to make this more secure
        github.user = "michzuerch";
        pull.rebase = true;
        push.default = "tracking";
      };
    };
    lazygit = {
      enable = true;
      settings = {
        gui = {
          showIcons = true;
          theme = {
            lightTheme = false;
            activeBorderColor = ["green" "bold"];
            inactiveBorderColor = ["grey"];
            selectedLineBgColor = ["blue"];
          };
        };
      };
    };
  };
  home.packages = with pkgs; [act github-desktop github-runner];
}
