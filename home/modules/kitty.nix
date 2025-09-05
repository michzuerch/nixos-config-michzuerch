_: {
  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = "0.85";
      modify_font = "cell_width 90%";

      scrollback_lines = 10000;
      initial_window_width = 1200;
      initial_window_height = 600;
      update_check_interval = 0;
      enable_audio_bell = false;
      confirm_os_window_close = "0";
      remember_window_size = "no";
      disable_ligatures = "never";
      url_style = "curly";
      copy_on_select = "clipboard";
      cursor_shape = "Underline";
      cursor_underline_thickness = 3;
      cursor_trail = 3;
      cursor_trail_decay = "0.1 0.4";
      window_padding_width = 10;
      open_url_with = "default";
      allow_remote_control = "yes";
      listen_on = "unix:/tmp/mykitty";
    };

    extraConfig = ''
      copy_on_select clipboard
      enable_audio_bell no
      window_padding_width 5
    '';
  };
}
