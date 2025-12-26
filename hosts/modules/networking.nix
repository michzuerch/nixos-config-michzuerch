{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    protonvpn-gui
  ];
  networking = {
    nameservers = [
      "8.8.8.8"
      "8.8.4.4"
      "1.1.1.1"
    ];
    networkmanager = {
      enable = true;
      wifi.powersave = true;
      plugins = with pkgs; [
        networkmanager-openvpn
      ];
    };
    enableIPv6 = true;
    usePredictableInterfaceNames = false;
    wireguard.enable = true;
    firewall = {
      logRefusedConnections = true;
      # checkReversePath = "loose"; # loose instead of strict for wireguard connections
      checkReversePath = false; # loose instead of strict for wireguard connections
      allowedTCPPorts = [
        22000 # Syncthing
        53317 # LocalSend
      ];
      allowedUDPPorts = [
        22000 # Syncthing
        21027 # Syncthing Discovery
        51820 # Wireguard
        53317 # LocalSend
      ];
    };
  };
  #  networking.nameservers = [
  #    "9.9.9.9#dns.quad9.net"
  #  ];
}
