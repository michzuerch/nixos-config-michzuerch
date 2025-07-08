{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.gcc
    pkgs.git
    pkgs.gh
    pkgs.ripgrep
    pkgs.fzf
    pkgs.yazi
    pkgs.mc
    pkgs.cpupower-gui
  ];
}
