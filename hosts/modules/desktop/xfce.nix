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
    mousepad
    thunar-archive-plugin
    thunar-volman
    xfce4-genmon-plugin
    xfce4-netload-plugin
    xfce4-power-manager
    xfce4-pulseaudio-plugin
    xfce4-weather-plugin
    xfwm4-themes
  ];
  environment.xfce.excludePackages = with pkgs; [
    xfce4-appfinder
    xfce4-taskmanager
    xfce4-terminal
  ];
}
