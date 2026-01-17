{inputs, ...}: {
  imports = [
    inputs.nix-doom-emacs-unstraightened.homeModule
  ];
  programs.doom-emacs = {
    enable = true;
    # doomDir = inputs.doom-config;  # or e.g. `./doom.d` for a local configuration
    doomDir = ./doom.d;
  };
}
