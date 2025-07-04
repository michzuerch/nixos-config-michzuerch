{pkgs, ...}: {
  home.file.".config/hypr/pyprland.toml".text = ''
    [pyprland]
    plugins = [
      "scratchpads",
      #"lost_windows",
      #"monitors",
      #"toggle_dpms",
      "magnify",
      #"expose",
      #"shift_monitors",
      #"workspaces_follow_focus",
    ]

    #[monitors.placement]
    #"Acer".top_center_of = "Sony"

    #[workspaces_follow_focus]
    #max_workspaces = 9

    #[expose]
    #include_special = false

    [scratchpads.stb]
    animation = "fromBottom"
    command = "kitty --class kitty-stb sstb"
    class = "kitty-stb"
    lazy = true
    size = "75% 45%"

    [scratchpads.stb-logs]
    animation = "fromTop"
    command = "kitty --class kitty-stb-logs stbLog"
    class = "kitty-stb-logs"
    lazy = true
    size = "75% 40%"

    [scratchpads.term]
    animation = "fromTop"
    command = "kitty --class kitty-dropterm"
    class = "kitty-dropterm"
    size = "75% 60%"

    [scratchpads.volume]
    animation = "fromRight"
    command = "pavucontrol"
    class = "org.pulseaudio.pavucontrol"
    lazy = true
    size = "40% 90%"
    unfocus = "hide"
  '';

  home.packages = with pkgs; [
    pyprland
  ];
}
