{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;

    settings = {
      input = {
        kb_layout = "us,de";
        kb_options = "grp:alt_caps_toggle";
        numlock_by_default = true;
        repeat_delay = 300;
        follow_mouse = 0;
        float_switch_override_focus = 0;
        mouse_refocus = 0;
        sensitivity = 0;
        touchpad = {
          natural_scroll = true;
        };
      };

      dwindle = {
        force_split = 2;
        special_scale_factor = 1.0;
        split_width_multiplier = 1.0;
        use_active_for_splits = true;
        pseudotile = "yes";
        preserve_split = "yes";
      };

      master = {
        new_status = "master";
        special_scale_factor = 1;
      };

      misc = {
        disable_autoreload = true;
        always_follow_on_dnd = true;
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
        layers_hog_keyboard_focus = true;
        animate_manual_resizes = false;
        enable_swallow = true;
        focus_on_activate = true;
        # new_window_takes_over_fullscreen = 2;
        middle_click_paste = false;
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
