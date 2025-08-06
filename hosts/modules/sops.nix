{config, ...}: {
  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";

    age.keyFile = "/home/michzuerch/.config/sops/age/keys.txt";

    secrets.github_api_key = {
      owner = config.users.users.michzuerch.name;
      mode = "0440";
    };
  };
}
