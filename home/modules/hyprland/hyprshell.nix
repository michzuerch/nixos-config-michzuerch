{inputs, ...}: {
  imports = [
    inputs.hyprshell.homeModules.hyprshell
  ];
  programs.hyprshell = {
    enable = true;
    systemd.args = "-v";
    settings = {
      windows = {
        overview = {
          key = "super_l";
          mod = "super";
          launcher = {
            max_items = 6;
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
        switcher.enable = false;
      };
    };
  };
}
