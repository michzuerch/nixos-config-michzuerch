{pkgs, ...}: {
  services = {
    desktopManager = {
      plasma6 = {
        enable = true;
        enableQt5Integration = false;
      };
    };
  };

  environment.systemPackages = with pkgs.kdePackages; [
    # kde apps
    dolphin
    dolphin-plugins
    gwenview
    ark

    # open with
    kservice
    kde-cli-tools

    # thumbnails
    ffmpegthumbs
    kio
    kio-extras
    kio-fuse
    kimageformats
    kdegraphics-thumbnailers
  ];

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    oxygen
    discover
    kate
  ];
}
