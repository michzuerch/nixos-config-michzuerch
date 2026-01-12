_: {
  #home.packages = [
  #  inputs.caelestia-shell.packages.${pkgs.stdenv.hostPlatform.system}.with-cli
  #];

  programs.caelestia = {
    enable = true;

    cli = {
      enable = true; # Also add caelestia-cli to path
      settings = {
        theme.enableGtk = false;
      };
    };
    settings = {
      appearance = {
        rounding = {
          scale = 0.9866195575842698;
        };
      };
      bar = {
        status = {
          showBattery = true;
        };
        clock = {
          showIcon = false;
        };
      };
      paths.wallpaperDir = "~/Images";
    };
  };
}
