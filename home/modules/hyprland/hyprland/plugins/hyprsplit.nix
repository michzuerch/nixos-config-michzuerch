{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    plugins = [
      pkgs.hyprlandPlugins.hyprsplit
    ];
    settings = {
      "plugin:hyprsplit" = {
        num_workspaces = 5;
      };
    };
  };
}
