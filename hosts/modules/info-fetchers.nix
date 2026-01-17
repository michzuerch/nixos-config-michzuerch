{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    macchina
    cpufetch
    octofetch
    htop
    gtop
    kmon
    nmon
    glances
    netdata
    monit
    vulkan-tools
    clinfo
    vdpauinfo
    libva-utils
    dig
    speedtest-rs
  ];
}
