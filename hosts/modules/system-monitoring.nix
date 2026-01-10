{pkgs, ...}: {
  programs.sysdig.enable = true;

  environment.systemPackages = with pkgs; [
    s-tui
    stress-ng
    atop
    iftop
    iotop
    linuxPackages_latest.perf
    perf-tools
  ];
}
