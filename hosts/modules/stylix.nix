{pkgs, ...}: let
  theme = "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";
in {
  stylix = {
    enable = true;
    enableReleaseChecks = false;
    base16Scheme = theme;
    polarity = "dark";
  };
  # 'config.stylix.targets.librewolf.profileNames = [ "<PROFILE_NAME>" ] ;'
  # 'config.stylix.targets.firefox.profileNames = [ "<PROFILE_NAME>" ] ;'
  # 'config.stylix.targets.zen-browser.profileNames = [ "<PROFILE_NAME>" ] ;'
}
