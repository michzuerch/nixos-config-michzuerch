{
  pkgs,
  inputs,
  nix-colors,
  ...
}: {
  imports = [
    inputs.nvf.homeManagerModules.default
    inputs.nur.modules.homeManager.default
    inputs.nix-index-database.hmModules.nix-index
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
    inputs.ags.homeManagerModules.default
    nix-colors.homeManagerModules.default
    # ../profiles/notebook.nix
    ../profiles/debug.nix
  ];

  colorScheme = nix-colors.colorSchemes.dracula;

  home = {
    username = "michzuerch";
    homeDirectory = "/home/michzuerch";
    stateVersion = "25.11";
    enableNixpkgsReleaseCheck = false;
    packages = with pkgs; [
      nautilus
      kdePackages.dolphin
      kdePackages.dolphin-plugins
      lxappearance
      showmethekey
    ];
  };
}
