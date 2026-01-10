{pkgs, ...}: {
  programs.zellij = {
    enable = false;
    package = pkgs.zellij;
    enableZshIntegration = true;
    enableBashIntegration = true;
    settings = {
      default_shell = "zsh";
      copy_command = "wl-copy";
      copy_on_select = true;
      pane_frames = false;
      default_layout = "compact";

      theme = "gruvbox-dark";

      keybinds = {
        normal = {
          unbind = [
            "Ctrl b"
            "Ctrl p"
            "Ctrl s"
          ];
          "bind \"Ctrl B\"".SwitchToMode._args = ["tmux"];
          "bind \"Ctrl P\"".SwitchToMode._args = ["pane"];
          "bind \"Ctrl S\"".SwitchToMode._args = ["scroll"];
        };
      };
    };
  };
}
