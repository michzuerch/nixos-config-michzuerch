{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = false;
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = ["Noto Serif"];
        sansSerif = ["Noto Sans"];
      };
    };
    packages = with pkgs; [
      cantarell-fonts
      fira-code
      fira-code-symbols
      font-awesome
      material-design-icons
      material-symbols
      nerd-fonts.jetbrains-mono
      nerd-fonts.caskaydia-cove
      nerd-fonts.iosevka
      noto-fonts
      jetbrains-mono
      noto-fonts-color-emoji
      powerline-fonts
      powerline-symbols
    ];
  };
}
