{pkgs, ...}: {
  home.packages = with pkgs; [
    # qbittorrent
    qbittorrent-enhanced
    transmission_4
  ];
}
