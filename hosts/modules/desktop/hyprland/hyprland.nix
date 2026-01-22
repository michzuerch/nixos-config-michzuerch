{pkgs, ...}: {
  programs = {
    hyprland = {
      enable = true;
      package = pkgs.hyprland;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
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
