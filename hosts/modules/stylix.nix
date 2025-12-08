{pkgs, ...}: let
  # theme = "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";
  theme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
  opacity = 0.95;
  fontSize = 11;
in {
  stylix = {
    enable = true;
    autoEnable = true;
    enableReleaseChecks = false;
    base16Scheme = theme;
    polarity = "dark";

    opacity = {
      terminal = opacity;
      popups = opacity;
    };

    cursor = {
      package = pkgs.phinger-cursors;
      name = "phinger-cursors";
      size = 24;
    };

    fonts = {
      serif = {
        package = pkgs.aleo-fonts;
        name = "Aleo";
      };

      sansSerif = {
        package = pkgs.noto-fonts-cjk-sans;
        name = "Noto Sans CJK JP";
      };

      monospace = {
        package = pkgs.maple-mono.variable;
        name = "Maple Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };

      sizes = {
        applications = fontSize;
        desktop = fontSize;
        popups = fontSize;
        terminal = fontSize;
      };
    };
    # targets.librewolf.profileNames = ["michzuerch"];
  };

  # 'config.stylix.targets.librewolf.profileNames = [ "<PROFILE_NAME>" ] ;'
  # 'config.stylix.targets.firefox.profileNames = [ "<PROFILE_NAME>" ] ;'
  # 'config.stylix.targets.zen-browser.profileNames = [ "<PROFILE_NAME>" ] ;'
}
