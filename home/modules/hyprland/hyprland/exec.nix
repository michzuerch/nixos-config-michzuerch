{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      #"waybar"
      "caelestia-shell"
      "systemctl --user start hyprpolkitagent"
      #"pypr --debug /tmp/pypr.log"
      "swaync"
      #"hyprpaper"
      "copyq --start-server"
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
      #"nm-applet --indicator"
      #"blueman-applet"
      "swayosd-server"
      #"hyprctl setcursor Bibata-Modern-Ice 24 &"
    ];
  };
}
