{pkgs, ...}: {
  home.packages = with pkgs; [
    nodejs
  ];
  programs = {
    bun = {
      enable = true;
      enableGitIntegration = true;
    };
  };
}
