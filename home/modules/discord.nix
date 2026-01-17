{inputs, ...}: {
  imports = [inputs.nixcord.homeModules.nixcord];

  programs.nixcord = {
    enable = true;
    discord.enable = false;
    vesktop.enable = true;
    equibop.enable = true;
    config = {frameless = true;};
  };
}
