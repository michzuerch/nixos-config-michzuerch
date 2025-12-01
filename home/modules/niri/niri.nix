{pkgs, ...}: {
  programs = {
    alacritty.enable = true; # Super+T in the default setting (terminal)
    fuzzel = {
      enable = true; # Super+D in the default setting (app launcher)
      settings = {
        main = {
          line-height = 25;
          fields = "name,generic,comment,categories,filename,keywords";
          terminal = "alacritty";
          prompt = "' ➜  '";
          layer = "top";
          lines = 10;
          width = 35;
          horizontal-pad = 25;
          inner-pad = 5;
        };
        border = {
          radius = 15;
          width = 3;
        };
      };
    };
    swaylock.enable = true; # Super+Alt+L in the default setting (screen locker)
    waybar.enable = true; # launch on startup in the default setting (bar)
  };
  services = {
    mako.enable = true; # notification daemon
    swayidle.enable = true; # idle management daemon
    polkit-gnome.enable = true; # polkit
  };
  home.packages = with pkgs; [
    swaybg # wallpaper
  ];

  xdg.configFile."niri/config.kdl".source = ./config.kdl;
}
