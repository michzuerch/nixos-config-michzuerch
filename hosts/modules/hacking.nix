{
  pkgs,
  inputs,
  ...
}: {
  programs.wireshark.enable = true;

  users.extraGroups.wireshark.members = ["michzuerch"];

  environment.systemPackages = with pkgs; [
    aircrack-ng
    airgeddon
    bettercap
    burpsuite
    caido
    hash-identifier
    hashcat
    hashcat-utils
    hping
    john
    johnny
    kismet
    inputs.eleakxir.packages.${pkgs.stdenv.hostPlatform.system}.leak-utils
    metasploit
    nmap
    ngrep
    nuclei
    tcpdump
    recon-ng
    sherlock
    sn0int
    snort
    wavemon
    wifite2
    wireguard-tools
    tshark
    termshark
  ];

  services.eleakxir = {
    enable = true;
    port = 9198;
    folders = ["/var/lib/eleakxir/leaks/"]; # Folders with parquet files
  };
}
