{pkgs, ...}: {
  home.packages = with pkgs; [
    darktable
    # font-manager
    gimp
    # glaxnimate
    kdePackages.gwenview
    inkscape-with-extensions
    pinta
    hypnotix
    krita
    scribus
    imagemagick
  ];
}
