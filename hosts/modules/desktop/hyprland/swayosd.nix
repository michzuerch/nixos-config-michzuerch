{pkgs, ...}: {
  environment.systemPackages = [pkgs.swayosd];
  services.udev.packages = [pkgs.swayosd];
}
