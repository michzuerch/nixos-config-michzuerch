_: {
  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = "0.85";
      modify_font = "cell_width 90%";
    };

    extraConfig = ''
      copy_on_select clipboard
      enable_audio_bell no
      window_padding_width 5
    '';
  };
}
