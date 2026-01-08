{
  pkgs,
  inputs,
  ...
}: {
  programs = {
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };
    nm-applet.enable = true;
    dconf.enable = true;
    light.enable = true;
    mtr.enable = true;
    thunar = {
      enable = true;
      plugins = with pkgs; [
        xfce4-exo
        mousepad
        thunar-archive-plugin
        thunar-volman
      ];
    };
  };
}
