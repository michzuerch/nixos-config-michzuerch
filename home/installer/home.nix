{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nur.modules.homeManager.default
    ../profiles/minimal.nix
  ];

  home = {
    username = "michzuerch";
    isNormalUser = true;
    #homeDirectory = "/home/michzuerch";
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
