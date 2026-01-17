{inputs, ...}: {
  imports = [inputs.nix-index-database.homeModules.nix-index];
  programs = {
    nix-index = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = false;
    };
    nix-index-database.comma.enable = true;
  };
}
