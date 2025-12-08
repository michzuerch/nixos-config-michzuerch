{
  # sops = {
  #   defaultSopsFile = ./../../secrets.yaml;
  #   defaultSopsFormat = "yaml";
  #   validateSopsFiles = false;
  #
  #   age = {
  #     keyFile = "/var/lib/sops-nix/age.age";
  #     generateKey = false;
  #   };
  #
  #   secrets = {
  #     github_api_key = {
  #       owner = config.users.users.michzuerch.name;
  #       mode = "0440";
  #     };
  #   };
  # };
  sops = {
    age.keyFile = "/var/lib/sops/keys.txt";
    # TODO: relative path
    defaultSopsFile = "/home/nebula/nixos-starship/secrets/secrets.yaml";
    defaultSopsFormat = "yaml";
    validateSopsFiles = false;
    # TODO: need to use mkDefault/mkOverride for systems that aren't nebula
    secrets = {
      # To edit:
      # $ nix-shell -p sops --run "sops secrets/secrets.yaml"
      "nano-gpt_key" = {
        neededForUsers = true;
      };
    };
  };
}
