{config, ...}: {
  sops = {
    defaultSopsFile = ./secrets.yaml;
    defaultSopsFormat = "yaml";

    age.keyFile = "./keys.txt";

    secrets.github_api_key = {
      owner = config.users.users.michzuerch.name;
      mode = "0440";
    };
  };
}
