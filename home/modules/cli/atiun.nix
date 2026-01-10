{
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    settings = {
      dialect = "us";
      style = "compact";
      inline_height = 15;
      store_failed = true;
    };
  };
}
