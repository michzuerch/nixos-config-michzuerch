{
  programs.hyprshell = {
    enable = true;
    systemd = {
      enable = true;
      args = "-v";
    };
    settings = {
      windows = {
        enable = true;
        scale = 8.5;
        items_per_row = 5;
        overview = {
          enable = true;
          strip_html_from_workspace_title = true;
          key = "o";
          modifier = "ctrl";
          filter_by = [];
          launcher = {
            max_items = 6;
            launch_modifier = "super";
            plugins.websearch = {
              enable = true;
              engines = [
                {
                  name = "DuckDuckGo";
                  url = "https://duckduckgo.com/?q=%s";
                  key = "d";
                }
              ];
            };
          };
        };
        switch = {
          enable = true;
          modifier = "alt";
        };
      };
    };
  };
}
