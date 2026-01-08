{pkgs, ...}: {
  programs.wireshark.enable = true;

  users.extraGroups.wireshark.members = ["michzuerch"];

  environment.systemPackages = with pkgs; [
    aircrack-ng
    airgeddon
    bettercap
    burpsuite
    hash-identifier
    hashcat
    hashcat-utils
    hping
    john
    johnny
    kismet
    metasploit
    nmap
    ngrep
    tcpdump
    recon-ng
    sherlock
    sn0int
    snort
    wavemon
    wifite2
    wireguard-tools
    wireshark
    tshark
    termshark
  ];
}
