{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    settings = {
      debug.disable_logs = false;
      "$mainMod" = "SUPER";
      "$terminal" = "alacritty";
      "$fileManager" = "nemo";

      xwayland = {
        force_zero_scaling = true;
      };

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        repeat_rate = 50;
        repeat_delay = 350;
        float_switch_override_focus = 1;
        mouse_refocus = true;
        sensitivity = 0.6; # -1.0 - 1.0, 0 means no modification.
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_invert = false;
        workspace_swipe_forever = true;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "slave";
        new_on_top = true;
        mfact = 0.5;
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
      };

      windowrulev2 = [
        "bordersize 0, floating:0, onworkspace:w[t1]"

        "float,class:(mpv)|(imv)|(showmethekey-gtk)"
        "move 990 60,size 900 170,pin,noinitialfocus,class:(showmethekey-gtk)"
        "noborder,nofocus,class:(showmethekey-gtk)"

        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"

        "opacity 0.0 override, class:^(xwaylandvideobridge)$"
        "noanim, class:^(xwaylandvideobridge)$"
        "noinitialfocus, class:^(xwaylandvideobridge)$"
        "maxsize 1 1, class:^(xwaylandvideobridge)$"
        "noblur, class:^(xwaylandvideobridge)$"
        "nofocus, class:^(xwaylandvideobridge)$"
      ];
    };
  };
  home.packages = with pkgs; [
    nemo-with-extensions
    copyq
    ffmpegthumbnailer
    grimblast
    gsettings-desktop-schemas
    hyprpicker
    hyprsysteminfo
    hyprpolkitagent
    kdePackages.filelight
    kdePackages.qtwayland
    networkmanagerapplet
    nwg-look
    pamixer
    pavucontrol
    qt6.qtwayland
    shotman
    slurp
    sov
    squeekboard # virtual keyboard
    swayosd
    wf-recorder
    wl-clipboard
    wlogout
    wlr-randr
    wlsunset
    wofi-emoji
    wtype
    xdg-desktop-portal
    xdg-desktop-portal-gtk
  ];
}
