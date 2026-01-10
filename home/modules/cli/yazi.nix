{
  pkgs,
  config,
  ...
}: {
  home.packages = [pkgs.ueberzugpp pkgs.libsixel];

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    shellWrapperName = "y";

    settings = {
      manager = {show_hidden = true;};
      preview = {
        max_width = 1000;
        max_height = 1000;
      };
    };
    keymap = {
      mgr.prepend_keymap = [
        {
          on = ["<C-f>"];
          run = "find";
        }
        {
          on = ["A"];
          run = "create --dir";
        }
        {
          on = [
            "g"
            "d"
          ];
          run = "cd ${config.xdg.userDirs.download}";
          desc = "Go to the downloads directory";
        }
        {
          on = [
            "g"
            "t"
          ];
          run = "cd ~/temp";
          desc = "Go to the temp directory";
        }
      ];
    };
  };
}
