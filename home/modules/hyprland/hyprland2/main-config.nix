{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;

    settings = {
      exec-once = [
        "waybar"
        "nm-applet --indicator"
        "swayidle -w timeout 300 'swaylock -f' before-sleep 'swaylock -f'"
      ];

      env = [
        "XCURSOR_SIZE,24"
        "QT_QPA_PLATFORM,wayland"
      ];

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
        };
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
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
