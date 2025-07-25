{
  pkgs,
  lib,
  config,
  ...
}: {
  environment.variables = {
    VDAPU_DRIVER = "va_gl";
  };
  environment.sessionVariables = {
    # NIX_GSETTINGS_OVERRIDES_DIR = let
    #   cfg = config.services.xserver.desktopManager.gnome;
    #   nixos-background-light = pkgs.nixos-artwork.wallpapers.simple-blue;
    #   nixos-background-dark = pkgs.nixos-artwork.wallpapers.simple-dark-gray;
    #   flashbackEnabled = cfg.flashback.enableMetacity || lib.length cfg.flashback.customSessions > 0;
    #   nixos-gsettings-desktop-schemas = pkgs.gnome.nixos-gsettings-overrides.override {
    #     inherit (cfg) extraGSettingsOverrides extraGSettingsOverridePackages favoriteAppsOverride;
    #     inherit flashbackEnabled nixos-background-dark nixos-background-light;
    #   };
    # in
    #   lib.mkForce (pkgs.glib.getSchemaPath nixos-gsettings-desktop-schemas);

    NIXOS_OZONE_WL = "1";
    DIRENV_LOG_FORMAT = "";
    # SPOTIFY_PATH = "${pkgs.spotify}/";
    # JDK_PATH = "${pkgs.jdk}/";
    # NODEJS_PATH = "${pkgs.nodePackages_latest.nodejs}/";

    CI = "1";
    # environment.variables.CLIPBOARD_EDITOR = "hx";
    CLIPBOARD_NOAUDIO = "1";
    # environment.variables.CLIPBOARD_NOGUI = "1";
    # environment.variables.CLIPBOARD_NOPROGRESS = "1";
    # environment.variables.CLIPBOARD_NOREMOTE = "1";
    CLIPBOARD_SILENT = "1";

    #OPENAI_API_KEY = "$cat(${config.sops.secrets.openai_api_key.path})";

    EMAIL = "michzuerch@gmail.com";
    NAME = "Michael Zuercher";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
    EDITOR = "nvim";
    VISUAL = "nvim";
    GSK_RENDERER = "gl";

    GITHUB_API_TOKEN = config.sops.secrets.github_api_key;
  };
}
