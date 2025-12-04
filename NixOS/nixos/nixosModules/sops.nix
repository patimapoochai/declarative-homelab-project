{ config, pkgs, ... }:

{
  sops.defaultSopsFile = ../../../sops-secrets/nixos.yml;
  sops.defaultSopsFormat = "yaml";

  # This will automatically import SSH keys as age keys
  sops.age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];

  # This is the actual specification of the secrets.
  sops.secrets."nixos/openssh_authorizedkey" = {};
  sops.templates."nixos-openssh-authorizedkey.toml".content = "${config.sops.placeholder."nixos/openssh_authorizedkey"}";
  sops.secrets."nixos/k3s/token" = {};
  sops.templates."nixos-k3s-token.toml".content = "${config.sops.placeholder."nixos/k3s/token"}";
  sops.secrets."nixos/k3s/serverAddr" = {};
  sops.templates."nixos-k3s-serverAddr.toml".content = "${config.sops.placeholder."nixos/k3s/serverAddr"}";
}
