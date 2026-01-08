{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    s-tui
    stress-ng
    atop
    iftop
    iotop
    sysdig
  ];
}
