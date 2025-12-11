{ config, pkgs, ... }:

{
  sops.secrets."nixos/k3s/token" = {};
  sops.secrets."nixos/k3s/serverAddr" = {};
  sops.templates."nixos-k3s-env.toml".content = ''
  K3S_URL=${config.sops.placeholder."nixos/k3s/serverAddr"}
  '';

  services.k3s = {
    enable = true;
    role = "agent";
    tokenFile = config.sops.secrets."nixos/k3s/token".path; # Add with ansible lineinfile
    environmentFile = config.sops.templates."nixos-k3s-env.toml".path; # Add with ansible lineinfile
    # serverAddr = "${builtins.readFile config.sops.secrets."nixos/k3s/serverAddr".path}"; # easy, but insecure way to do this
  };
}
