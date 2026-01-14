{
  programs.ghostty = {
    enable = true;
    enableBashIntegration = false;
    enableFishIntegration = false;
    enableZshIntegration = true;
    installBatSyntax = true;
    installVimSyntax = true;
    clearDefaultKeybinds = true;

    settings = {
      font-family = [
        "FiraCode Nerd Font Mono Med"
        "DejaVu Sans"
      ];
      font-size = 17;
      font-feature = [
        "calt"
        "ss03"
      ];

      bold-is-bright = false;
      selection-invert-fg-bg = true;

      # Theme
      #theme = "gruvbox";
      background-opacity = 0.66;

      cursor-style = "bar";
      cursor-style-blink = false;
      adjust-cursor-thickness = 1;

      resize-overlay = "never";
      copy-on-select = false;
      confirm-close-surface = false;
      mouse-hide-while-typing = true;

      window-theme = "ghostty";
      window-padding-x = 10;
      window-padding-y = 10;
      window-padding-balance = true;
      window-padding-color = "background";
      window-inherit-working-directory = true;
      window-inherit-font-size = true;
      window-decoration = false;

      gtk-titlebar = false;
      gtk-single-instance = false;
      gtk-tabs-location = "bottom";
      gtk-wide-tabs = false;

      auto-update = "off";
      term = "ghostty";
      clipboard-paste-protection = false;

      keybind = [
        "ctrl+j=goto_split:left"
        "ctrl+i=goto_split:up"
        "ctrl+k=goto_split:down"
        "ctrl+l=goto_split:right"
        "shift+ctrl+j=new_split:left"
        "shift+ctrl+i=new_split:up"
        "shift+ctrl+k=new_split:down"
        "shift+ctrl+l=new_split:right"
        "shift+ctrl+tab=new_tab"
      ];
    };
    # themes.gruvbox = {
    #   background = "1d2021";
    #   foreground = "fbf1c7";

    #   cursor-color = "D5C4A1";

    #   selection-foreground = "282828";
    #   selection-background = "98971A";

    #   palette = [
    #     "0=#32302f"
    #     "1=#cc241d"
    #     "2=#98971a"
    #     "3=#d79921"
    #     "4=#458588"
    #     "5=#b16286"
    #     "6=#689d6a"
    #     "7=#ebdbb2"

    #     "8=#928374"
    #     "9=#fb4934"
    #     "10=#b8bb26"
    #     "11=#fabd2f"
    #     "12=#83a598"
    #     "13=#d3869b"
    #     "14=#8ec07c"
    #     "15=#fbf1c7"
    #   ];
    # };
  };
}
