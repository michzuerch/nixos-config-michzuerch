{
  wayland.windowManager.hyprland.settings = {
    bindin = [
      # Launcher
      "$mainMod, mouse:272, global, caelestia:launcherInterrupt"
      "$mainMod, mouse:273, global, caelestia:launcherInterrupt"
      "$mainMod, mouse:274, global, caelestia:launcherInterrupt"
      "$mainMod, mouse:275, global, caelestia:launcherInterrupt"
      "$mainMod, mouse:276, global, caelestia:launcherInterrupt"
      "$mainMod, mouse:277, global, caelestia:launcherInterrupt"
      "$mainMod, mouse_up, global, caelestia:launcherInterrupt"
      "$mainMod, mouse_down, global, caelestia:launcherInterrupt"
    ];
    bind = [
      # Launcher
      "$mainMod, SPACE, global, caelestia:launcher"
      "$mainMod, X, global, caelestia:session" # Powermenu

      # Misc
      "$mainMod, L, global, caelestia:lock"
      "$mainMod, N, exec, caelestia shell drawers toggle sidebar"

      # Utilities
      "$mainMod+Shift, SPACE, exec, caelestia shell gameMode toggle" # Toggle Focus/Game mode
      "$mainMod+Shift, S, global, caelestia:screenshotFreeze" # Capture region (freeze)
      "$mainMod+Shift+Alt, S, global, caelestia:screenshot" # Capture region
      "$mainMod+Alt, R, exec, caelestia record -s" # Record screen with sound
      "Ctrl+Alt, R, exec, caelestia record" # Record screen
      "$mainMod+Shift+Alt, R, exec, caelestia record -r" # Record region

      "$mainMod+Shift, E, exec, pkill fuzzel || caelestia emoji -p"
    ];
    bindl = [
      # Brightness
      ", XF86MonBrightnessUp, global, caelestia:brightnessUp"
      ", XF86MonBrightnessDown, global, caelestia:brightnessDown"
      "$mainMod, F2, exec, nightshift-toggle"
      "$mainMod, F3, exec, nightshift-toggle"

      # Media
      ", XF86AudioPlay, global, caelestia:mediaToggle"
      ", XF86AudioPause, global, caelestia:mediaToggle"
      ", XF86AudioNext, global, caelestia:mediaNext"
      ", XF86AudioPrev, global, caelestia:mediaPrev"
      ", XF86AudioStop, global, caelestia:mediaStop"

      # Sound
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

      # Utilities
      ", Print, exec, caelestia screenshot" # Full screen capture > clipboard
    ];
    bindle = [
      ", XF86AudioRaiseVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ];
  };
}
