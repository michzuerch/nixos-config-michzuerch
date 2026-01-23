{
  pkgs,
  lib,
  ...
}: let
  rounding = 10 + 12 * 2;
in {
  home.packages = with pkgs; [
    papirus-icon-theme
  ];

  programs.caelestia.settings = {
    paths.sessionGif = ./session-gif-hacker-cat.gif;
    appearance = {
      anim.duration.scale = 1;
      rounding.scale = 0.5;
      spacing.scale = 1;
      padding = 24; # 12

      transparency = {
        enable = true;
        base = 0.85;
        layers = 0.4;
      };
      font.family = {
        material = "Material Symbols Rounded";
        mono = "CaskaydiaCove NF";
        sans = "Rubik";
      };
    };
    utilities = {
      enabled = true;
      maxToasts = 4;
      toasts = {
        audioInputChanged = true;
        audioOutputChanged = true;
        capsLockChanged = false;
        chargingChanged = true;
        configLoaded = false;
        dndChanged = true;
        gameModeChanged = true;
        numLockChanged = false;
        nowPlaying = false;
        kbLayoutChanged = false;
      };
    };
    border = {
      inherit rounding;
      thickness = 8;
    };
    general = {
      #apps = {
      #  audio = "${pkgs.pavucontrol}/bin/pavucontrol";
      #  terminal = "${pkgs.kitty}/bin/kitty";
      #};
    };

    dashboard = {
      enabled = true;
      showOnHover = true;
      mediaUpdateInterval = 500;
      dragThreshold = 50;
      sizes = {
        tabIndicatorHeight = 3;
        tabIndicatorSpacing = 5;
        infoWidth = 200;
        infoIconSize = 25;
        dateTimeWidth = 110;
        mediaWidth = 200;
        mediaProgressSweep = 180;
        mediaProgressThickness = 8;
        resourceProgessThickness = 10;
        weatherWidth = 250;
        mediaCoverArtSize = 0; # 150
        mediaVisualiserSize = 0; # 80
        resourceSize = 200;
      };
    };
    background = {
      enabled = false;
      desktopClock.enabled = false;
      visualiser.enabled = false;
    };

    services = {
      useFahrenheit = false;
      useTwelveHourClock = false;
      weatherLocation = lib.mkDefault "Konstanz";
    };
    cli = {
      enable = true;
      settings = {
        theme = {
          enableTerm = false;
          enableBtop = false;
          enableGtk = false;
        };
      };
    };

    paths.wallpaperDir = "~/wallpapers";
  };
}
