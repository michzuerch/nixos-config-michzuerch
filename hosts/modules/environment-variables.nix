{
  pkgs,
  config,
  ...
}: {
  environment.variables = {
    VDAPU_DRIVER = "va_gl";
  };
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    DIRENV_LOG_FORMAT = "";
    JDK_PATH = "${pkgs.jdk}/";
    NODEJS_PATH = "${pkgs.nodePackages_latest.nodejs}/";
    QML_IMPORT_PATH = "${pkgs.hyprland-qt-support}/lib/qt-6/qml";

    CI = "1";
    CLIPBOARD_NOAUDIO = "1";
    CLIPBOARD_SILENT = "1";

    #OPENAI_API_KEY = "$cat(${config.sops.secrets.openai_api_key.path})";

    EMAIL = "michzuerch@gmail.com";
    NAME = "Michael Zuercher";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
    EDITOR = "nvim";
    VISUAL = "nvim";
    GSK_RENDERER = "gl";

    # NIX_PATH = "nixpkgs=flake:nixpkgs";
    # GITHUB_API_TOKEN = config.sops.secrets.github_api_key.path;
  };
}
