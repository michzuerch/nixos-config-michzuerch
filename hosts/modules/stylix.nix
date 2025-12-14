{
  pkgs,
  # inputs,
  ...
}: let
  theme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
  opacity = 0.95;
  fontSize = 13;
in {
  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "either";
    base16Scheme = theme;
    opacity = {
      applications = opacity;
      desktop = opacity;
      terminal = opacity;
      popups = opacity;
    };

    cursor = {
      # name = "DMZ-Black";
      # size = 24;
      # package = pkgs.vanilla-dmz;

      name = "Bibata-Modern-Ice";
      size = 24;
      package = pkgs.bibata-cursors;
    };

    fonts = {
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-color-emoji;
      };
      monospace = {
        name = "JetBrains Mono";
        package = pkgs.jetbrains-mono;
      };
      sansSerif = {
        name = "Noto Sans";
        package = pkgs.noto-fonts;
      };
      serif = {
        name = "Noto Serif";
        package = pkgs.noto-fonts;
      };
      sizes = {
        applications = fontSize;
        desktop = fontSize;
        popups = fontSize;
        terminal = fontSize;
      };
    };
    icons.enable = true;
    iconTheme = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };

    image = pkgs.fetchurl {
      url = "https://codeberg.org/lunik1/nixos-logo-gruvbox-wallpaper/raw/branch/master/png/gruvbox-dark-rainbow.png";
      sha256 = "036gqhbf6s5ddgvfbgn6iqbzgizssyf7820m5815b2gd748jw8zc";
    };
  };
}
