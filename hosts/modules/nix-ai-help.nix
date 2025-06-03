{
  services.nixai = {
    enable = true;
    mcp = {
      enable = true;
      host = "localhost";
      aiProvider = "ollama"; # Change to "openai" or "gemini" if preferred
      aiModel = "llama3";
      # Add custom documentation sources
      documentationSources = [
        "https://wiki.nixos.org/wiki/NixOS_Wiki"
        "https://nix.dev/manual/nix"
        "https://nixos.org/manual/nixpkgs/stable/"
        #"https://your-company.com/nixos-docs"  # Custom source
      ];
    };
  };
}
