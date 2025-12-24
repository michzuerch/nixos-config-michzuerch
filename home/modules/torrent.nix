{pkgs, ...}: {
  home.packages = with pkgs; [
    # qbittorrent
    jackett
    qbittorrent-enhanced
    transmission_4
  ];
}
