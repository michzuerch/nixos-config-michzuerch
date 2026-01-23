_: {
  programs.fzf = {
    enable = true;
    defaultCommand = "fd --type f --hidden --no-ignore --follow --exclude .git";
    enableZshIntegration = true;
    enableFishIntegration = false;
  };
}
