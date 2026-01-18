{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nur.modules.homeManager.default
    #inputs.caelestia-shell.homeManagerModules.default
    ../profiles/complete.nix
    # ../profiles/onlyplasma6.nix
  ];

  home = {
    username = "michzuerch";
    homeDirectory = "/home/michzuerch";
    stateVersion = "26.05";
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
