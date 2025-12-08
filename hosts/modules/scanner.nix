{pkgs, ...}: {
  hardware = {
    sane = {
      enable = true;
      extraBackends = with pkgs; [sane-airscan hplipWithPlugin epkowa];
    };
  };
  services = {
    udev.packages = [pkgs.sane-airscan];
    avahi = {
      enable = true;
      nssmdns4 = true;
    };
  };
}
