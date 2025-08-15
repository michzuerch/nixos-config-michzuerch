{pkgs, ...}: {
  services.xserver = {
    # enable = true;
    desktopManager.xfce = {
      enable = true;
      noDesktop = false;
      enableXfwm = true;
      # xterm.enable = false;
    };
  };
  environment.systemPackages = with pkgs; [
    wmctrl
    xclip
    xfce.mousepad
    xfce.thunar-archive-plugin
    xfce.thunar-volman
    xfce.xfce4-genmon-plugin
    xfce.xfce4-netload-plugin
    xfce.xfce4-power-manager
    xfce.xfce4-pulseaudio-plugin
    xfce.xfce4-weather-plugin
    xfce.xfwm4-themes
  ];
  environment.xfce.excludePackages = with pkgs; [
    xfce.xfce4-appfinder
    xfce.xfce4-taskmanager
    xfce.xfce4-terminal
  ];
}
