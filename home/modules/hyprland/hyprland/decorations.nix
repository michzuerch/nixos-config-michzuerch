{
  wayland.windowManager.hyprland.settings = {
    decoration = {
      rounding = 10;
      # dim_inactive = false;
      active_opacity = 1;
      inactive_opacity = 0.75;

      shadow = {
        enabled = true;
        ignore_window = true;
        offset = "0 2";
        range = 20;
        render_power = 3;
      };

      blur = {
        enabled = true;
        size = 3;
        passes = 2;
        brightness = 1;
        contrast = 1.4;
        ignore_opacity = true;
        noise = 0;
        new_optimizations = true;
        xray = true;
      };
    };
  };
}
