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
      bar.status = {
        showBattery = false;
      };
      paths.wallpaperDir = "~/Images";
    };
  };
}
