{
  imports = [
    #./cinnamon.nix
    #./cosmic.nix
    # ./gnome.nix Build broken May 30 2025
    ./hyprland.nix
    #./mate.nix
    # Cant use patheon together with gnome
    # ./pantheon.nix
    #./plasma6.nix
    ./xfce.nix
  ];
}
