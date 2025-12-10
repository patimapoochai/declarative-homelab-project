{ config, pkgs, ... }:

{
  services.k3s = {
    enable = true;
    role = "agent";
    tokenFile = config.sops.templates."nixos-k3s-token.toml".path; # Add with ansible lineinfile
    environmentFile = config.sops.templates."nixos-k3s-env.toml".path; # Add with ansible lineinfile
  };
}
