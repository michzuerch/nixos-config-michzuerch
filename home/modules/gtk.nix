{pkgs, ...}: {
  gtk = {
    enable = true;

    gtk2.enable = false;

    font = {
      package = pkgs.noto-fonts;
      name = "NotoSans";
    };

    cursorTheme = {
      #   name = "Catppuccin-Macchiato-Blue";
      #   package = pkgs.catppuccin-cursors.macchiatoBlue;
      package = pkgs.bibata-cursors;
      name = "Bibata-Original-Ice";
      size = 24;
    };

    theme = {
      #   name = "Juno-ocean";
      #   package = pkgs.juno-theme;
      name = "Catppuccin-Macchiato-Compact-Blue-dark";
      package = pkgs.catppuccin-gtk.override {
        size = "compact";
        accents = ["blue"];
        variant = "macchiato";
      };
    };

    iconTheme = {
      #   name = "BeautyLine";
      #   package = pkgs.beauty-line-icon-theme;
      name = "Papirus-Dark";
      package = pkgs.papirus-folders;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme = 1;
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme = 1;
      '';
    };
  };
}
