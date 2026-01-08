{pkgs, ...}: {
  programs.sysdig.enable = true;

  environment.systemPackages = with pkgs; [
    s-tui
    stress-ng
    atop
    iftop
    iotop
    linuxKernel.packages.linux_6_18.sysdig # Move to kernel.nix???
  ];
}
