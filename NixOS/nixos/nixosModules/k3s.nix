{ config, pkgs, ... }:

{
  services.k3s = {
    enable = true;
    role = "agent";
    token = ${config.sops.templates."nixos-k3s-token.toml".path}; # Add with ansible lineinfile
    serverAddr = ${config.sops.templates."nixos-k3s-serverAddr.toml".path}; # Add with ansible lineinfile
  };
}
