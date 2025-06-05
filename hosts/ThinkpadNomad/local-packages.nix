{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gcc
    git
    gh
    ripgrep
    fzf
    yazi
    mc
    niv
  ];
}
