{pkgs, ...}: let
  theme = "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";
in {
  stylix = {
    enable = true;
    base16Scheme = theme;
  };
}
