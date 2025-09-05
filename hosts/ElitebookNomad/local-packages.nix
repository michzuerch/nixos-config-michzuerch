{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.gcc
    pkgs.git
    pkgs.gh
    pkgs.ripgrep
    pkgs.fzf
    pkgs.lm_sensors
    pkgs.yazi
    pkgs.mc
    pkgs.nbfc-linux
    pkgs.cpupower-gui
  ];
}
