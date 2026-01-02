{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nvf.homeManagerModules.default
    inputs.nur.modules.homeManager.default
    inputs.nix-index-database.homeModules.nix-index
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
    inputs.plasma-manager.homeModules.plasma-manager
    inputs.nix-doom-emacs.hmModule
    ../profiles/complete.nix
    # ../profiles/onlyplasma6.nix
  ];

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
