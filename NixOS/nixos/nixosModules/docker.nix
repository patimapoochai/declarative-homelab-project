{ config, pkgs, ... }:

{
  virtualisation.docker.enable = true;
  
  users.extraGroups.docker.members = ["ansible"];

  networking.firewall = {
    allowedTCPPortRanges = [{
      from = 3000;
      to = 5000;
    }];

    allowedUDPPortRanges = [{
      from = 3000;
      to = 5000;
    }];
  };
}
