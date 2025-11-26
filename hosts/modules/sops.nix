{config, ...}: {
  sops = {
    defaultSopsFile = ./../../secrets.yaml;
    defaultSopsFormat = "yaml";
    validateSopsFiles = false;

    age = {
      keyFile = "/var/lib/sops-nix/age.age";
      generateKey = false;
    };

    secrets = {
      github_api_key = {
        owner = config.users.users.michzuerch.name;
        mode = "0440";
      };
    };
  };
}
