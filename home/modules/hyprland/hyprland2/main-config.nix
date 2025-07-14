{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;

    settings = {
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
        };
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
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
