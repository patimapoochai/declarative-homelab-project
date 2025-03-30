{ config, pkgs, ... }:

{
  services.k3s = {
    enable = true;
    role = "agent";
    token = ""; # Add with ansible lineinfile
    serverAddr = ""; # Add with ansible lineinfile
  };
}
