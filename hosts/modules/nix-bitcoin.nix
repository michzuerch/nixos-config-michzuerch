{
  # Automatically generate all secrets required by services.
  # The secrets are stored in /etc/nix-bitcoin-secrets
  nix-bitcoin = {
    generateSecrets = true;
    nodeinfo.enable = true;
    operator = {
      enable = true;
      # FIXME: Set this to your system's main user
      name = "michzuerch";
    };
  };

  # Enable some services.
  # See ../configuration.nix for all available features.
  services = {
    bitcoind = {
      enable = true;
      prune = 100000;
      # txindex = true;
      dataDir = "/bitcoin";
    };
    clightning = {
      enable = true;
    };
    # rtl = {
    #   enable = true;
    # };
  };
}
