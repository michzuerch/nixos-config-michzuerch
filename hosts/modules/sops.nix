{
  sops.defaultSopsFile = ../../secrets.yaml;
  sops.defaultSopsFormat = "yaml";

  sops.age.keyFile = "/home/michzuerch/.config/sops/age/keys.txt";
}
