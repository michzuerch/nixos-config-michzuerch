{
  programs.hyprlock = {
    enable = true;
    settings = {
      auth.fingerprint.enabled = true;
      general = {
        disable_loading_bar = true;
        grace = 10;
        hide_cursor = true;
        no_fade_in = false;
      };
      animations = {
        enabled = true;
        bezier = [
          "easeout,0.5, 1, 0.9, 1"
          "easeoutback,0.34,1.22,0.65,1"
        ];
        animation = [
          "fade, 1, 3, easeout"
          "inputField, 1, 1, easeoutback"
        ];
      };

      background = {
        path = "~/Wallpapers/windows11.jpg";
      };
      input-field = {
        size = "200, 50";
        position = "0, -80";
        dots_center = true;
        outline_thickness = 5;
        placeholder_text = "Enter password";
        shadow_passes = 1;
        font_family = "JetBrains Mono";
        check_color = "rgb(b7c5d3)";
        fail_color = "rgb(f7768e)";
        font_color = "rgb(d8e2ec)";
        inner_color = "rgb(171d23)";
        outer_color = "rgb(526270)";
      };
    };
  };
}
