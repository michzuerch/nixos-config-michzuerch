{
  sops = {
    defaultSopsFile = ./secrets/secrets.yaml;
    defaultSopsFormat = "yaml";

    age.keyFile = "/home/michzuerch/.config/sops/age/keys.txt";

    secrets.github_api_key = {};
  };
}
