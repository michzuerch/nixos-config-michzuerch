{pkgs, ...}: {
  gtk = {
    enable = true;

    cursorTheme = {
      name = "Catppuccin-Macchiato-Blue";
      package = pkgs.catppuccin-cursors.macchiatoBlue;
    };

    theme = {
      name = "Catppuccin-Macchiato-Compact-Blue-dark";
      package = pkgs.catppuccin-gtk.override {
        size = "compact";
        accents = ["blue"];
        variant = "macchiato";
      };
    };
    # theme = {
    #   name = "Juno-ocean";
    #   package = pkgs.juno-theme;
    # };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-folders;
    };
    # iconTheme = {
    #   name = "BeautyLine";
    #   package = pkgs.beauty-line-icon-theme;
    # };

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
